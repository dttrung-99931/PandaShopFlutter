// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

part 'product_cate_input_event.dart';
part 'product_cate_input_state.dart';

ProductCateInputBloc get inputProductCateBloc => getIt();

@lazySingleton
class ProductCateInputBloc extends BaseBloc with AddressBlocMixin {
  ProductCateInputBloc(this._getProductCates, this._getProductCateById) : super(InitialState()) {
    on<OnGetProductCates>(_onGetProductCates);
    on<OnProductCateSelected>(_onSelectProductCate);
    on<OnGetSelectedProductCates>(_onGetSelectedProductCates);
  }
  final GetProductCatesUseCase _getProductCates;
  final GetProductCateByIdUseCase _getProductCateById;
  // Map<level, product cates>
  final Map<int, List<ProductCategoryDto>> _productCatesMap = {};

  FutureOr<void> _onGetProductCates(OnGetProductCates event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductCates.call(GetProductCatesRequestModel(
        parentId: event.parentId,
        level: event.level,
      )),
      emit: emit,
      onSuccess: (List<ProductCategoryDto> result) {
        _productCatesMap[event.level] = [...result];
        return GetProductCatesSelectSucess.factory(level: event.level, data: result, selectedId: event.selectedId);
      },
    );
  }

  FutureOr<void> _onSelectProductCate(OnProductCateSelected event, Emitter<BaseState> emit) async {
    int level = event.selected.level;
    if (!_productCatesMap.containsKey(level)) {
      return;
    }
    emit(GetProductCatesSelectSucess.factory(
      level: level,
      data: _productCatesMap[level]!,
      selectedId: event.selected.id,
    ));
    // Load child cates
    if (level < 3) {
      add(OnGetProductCates(level: level + 1, parentId: event.selected.id));
    }
  }

  FutureOr<void> _onGetSelectedProductCates(OnGetSelectedProductCates event, Emitter<BaseState> emit) async {
    if (event.productCategoryId != null) {
      await _getSelectedCates(event.productCategoryId!, emit);
    } else {
      _getInitCates();
    }
  }

  void _getInitCates() {
    add(OnGetProductCates(level: 1));
    add(OnGetProductCates(level: 2));
    add(OnGetProductCates(level: 3));
  }

  Future<void> _getSelectedCates(int selectedCateId, Emitter<BaseState> emit) async {
    int? cateId = selectedCateId;
    while (cateId != null) {
      ProductCategoryDto? productCate = await handleUsecaseResult(
        usecaseResult: _getProductCateById.call(cateId),
        emit: emit,
      );
      if (productCate != null) {
        add(OnGetProductCates(level: productCate.level, selectedId: productCate.id));
        cateId = productCate.parentId;
      } else {
        logd('OnInitProductCate Product cate not found $selectedCateId');
        cateId = null;
      }
    }
  }
}
