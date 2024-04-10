// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_batch_input_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/product_inventory/product_inventory_inp_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_inventory_input_event.dart';
part 'product_inventory_input_state.dart';

ProductInventoryInputBloc get productInventoryInpBloc => getIt();

@lazySingleton
class ProductInventoryInputBloc extends BaseBloc {
  ProductInventoryInputBloc(
    this._getProducts,
  ) : super(InitialState()) {
    on<OnAddInventoryInput>(_onAddInventoryInput);
    on<OnGetShopProdsToSelect>(_onGetShopProdsToSelect);
    on<OnProductBatchAdded>(_onProductBatchAdded);
    on<OnInventoryProdSelected>(_onInventoryProdSelected);
  }
  final GetProductsUseCase _getProducts;
  final List<ProductInventoryInpDto> _inputs = [];
  List<ProductDto>? _cacheShopProducts;

  FutureOr<void> _onAddInventoryInput(OnAddInventoryInput event, Emitter<BaseState> emit) async {
    // TODO
    _inputs.add(ProductInventoryInpDto(productBatches: [], productId: -1));
    emit(ProductInventoryInpsUpdated([..._inputs]));
  }

  FutureOr<void> _onGetShopProdsToSelect(OnGetShopProdsToSelect event, Emitter<BaseState> emit) async {
    if (_cacheShopProducts != null) {
      emit(GetShopProductsToSelectSucess(_cacheShopProducts!, selectedId: null));
      return;
    }
    await handleUsecaseResult(
      usecaseResult: _getProducts.call(GetProductsRequestModel.shopProducts()),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetShopProductsToSelectSucess(_cacheShopProducts = result, selectedId: null);
      },
    );
  }

  FutureOr<void> _onProductBatchAdded(OnProductBatchAdded event, Emitter<BaseState> emit) {
    _getInput(event.productBatch.productInventoryInputId).productBatches.add(event.productBatch);
    emit(ProductInventoryInpsUpdated([..._inputs]));
  }

  ProductInventoryInpDto _getInput(int productInventoryId) {
    return _inputs.firstWhere((element) => element.id == productInventoryId);
  }

  FutureOr<void> _onInventoryProdSelected(OnInventoryProdSelected event, Emitter<BaseState> emit) {
    _getInput(event.productInventoryInpId).productId = event.selectedProduct.id;
    emit(ProductInventoryInpsUpdated([..._inputs]));
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}
