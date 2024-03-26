// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_cates_usecase.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

part 'input_product_cate_event.dart';
part 'input_product_cate_state.dart';

InputProductCateBloc get inputProductCateBloc => getIt();

@lazySingleton
class InputProductCateBloc extends BaseBloc with AddressBlocMixin {
  InputProductCateBloc(this._getProductCates) : super(InitialState()) {
    on<OnGetProductCates>(_onGetProductCates);
    on<OnProductCateSelected>(_onSelectProductCate);
  }
  final GetProductCatesUseCase _getProductCates;
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
        return GetProductCatesSelectSucess.factory(level: event.level, data: result);
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
}
