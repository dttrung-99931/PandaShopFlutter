// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_detail_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_batch_input_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_batch_input_event.dart';
part 'product_batch_input_state.dart';

ProductBatchInputBloc get productBatchInpBloc => getIt();

@lazySingleton
class ProductBatchInputBloc extends BaseBloc {
  ProductBatchInputBloc(
    this._getProductDetail,
  ) : super(InitialState()) {
    on<OnAddProductBatchInput>(_onAddBatchInput);
    on<OnGetProdOptionsToSelect>(_onGetProdOptionsToSelect);
    on<OnProdOptionSelected>(_onProdOptionSelected);
  }
  final List<ProductBatchInputDto> _productBatches = [];
  final GetProductDetailUseCase _getProductDetail;
  // Map<prouctId, options>
  final Map<int, List<ProductOptionDto>> cacheProductOptions = {};

  FutureOr<void> _onAddBatchInput(OnAddProductBatchInput event, Emitter<BaseState> emit) async {
    ProductBatchInputDto added = ProductBatchInputDto(
      productInventoryInputId: event.productInventoryId,
      productId: event.productId,
    );
    _productBatches.add(added);
    emit(ProductBatchAdded(added));
  }

  FutureOr<void> _onGetProdOptionsToSelect(OnGetProdOptionsToSelect event, Emitter<BaseState> emit) async {
    ProductBatchInputDto batch = getProductBatchInput(event.productBatchnInpId);
    if (cacheProductOptions[batch.productId] != null) {
      emit(GetProductOptsToSelectSucess(
        _getCacheProductOptionsOf(batch.productId),
        selectedId: batch.productOptionId,
        productBatchInpId: event.productBatchnInpId,
      ));
      return;
    }
    await handleUsecaseResult(
      usecaseResult: _getProductDetail.call(batch.productId),
      emit: emit.call,
      onSuccess: (ProductDetailDto? product) {
        if (product != null) {
          cacheProductOptions[product.id] = [...product.options];
          return GetProductOptsToSelectSucess(
            product.options,
            selectedId: null,
            productBatchInpId: event.productBatchnInpId,
          );
        }
        return null;
      },
    );
  }

  // Return product options to select, ignore options that was selected
  List<ProductOptionDto> _getCacheProductOptionsOf(int productId, {int? selectedOptionId}) {
    List<int> selectOptIds = getSelectedProdOptIdsOf(productId).except(
      [if (selectedOptionId != null) selectedOptionId],
    );
    return cacheProductOptions[productId]?.where((element) => !selectOptIds.contains(element.id)).toList() ?? [];
  }

  List<int> getSelectedProdOptIdsOf(int productId) {
    return _productBatches
        .where((element) => element.productId == productId && element.productOptionId != null)
        .mapList((element) => element.productOptionId!);
  }

  ProductBatchInputDto getProductBatchInput(int id) {
    return _productBatches.firstWhere((element) => element.id == id);
  }

  FutureOr<void> _onProdOptionSelected(OnProdOptionSelected event, Emitter<BaseState> emit) {
    ProductBatchInputDto batch = getProductBatchInput(event.productBatchInpId);
    batch.productOptionId = event.selectedOption.id;
    // ProductBatchInputDto updated = batch.copyWith(
    //   productOptionId: event.selectedOption.id,
    // );
    // _productBatches.replaceWhere((ProductBatchInputDto element) => element.id == updated.id, updated);
    emit(GetProductOptsToSelectSucess(
      _getCacheProductOptionsOf(batch.productId, selectedOptionId: event.selectedOption.id),
      selectedId: event.selectedOption.id,
      productBatchInpId: event.productBatchInpId,
    ));
  }
}
