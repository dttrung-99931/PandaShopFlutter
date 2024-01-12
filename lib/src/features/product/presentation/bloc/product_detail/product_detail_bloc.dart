// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../../../../core/base_bloc/base_event.dart';
import '../../../domain/use_cases/get_product_detail_usecase.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@lazySingleton
class ProductDetailBloc extends BaseBloc {
  final GetProductDetailUseCase _getProductDetailUsecase;

  ProductDetailBloc(this._getProductDetailUsecase) : super(InitialState()) {
    onLoad<OnGetProductDetail>(
      _onGetProductDetail,
      loadingStateBuilder: (_) => LoadingProductDetail(),
    );
  }

  Future<void> _onGetProductDetail(OnGetProductDetail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductDetailUsecase.call(event.id),
      emit: emit,
      onSuccess: (ProductDetailDto? result) {
        return GetProductDetailSucess(result);
      },
    );
  }
}
