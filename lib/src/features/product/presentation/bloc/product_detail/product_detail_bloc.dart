// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';
import '../../../domain/use_cases/product/get_product_detail_usecase.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

ProductDetailBloc get productDetailBloc => getIt<ProductDetailBloc>();

@lazySingleton
class ProductDetailBloc extends BaseBloc {
  final GetProductDetailUseCase _getProductDetailUsecase;
  late ProductDetailDto _productDetail;
  ProductDetailDto get productDetail => _productDetail;

  ProductDetailBloc(this._getProductDetailUsecase) : super(InitialState()) {
    onLoad<OnGetProductDetail>(
      _onGetProductDetail,
      loadingBuilder: (_) => LoadingProductDetail(),
    );
  }

  Future<void> _onGetProductDetail(OnGetProductDetail event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductDetailUsecase.call(event.id),
      emit: emit.call,
      onSuccess: (ProductDetailDto? result) {
        if (result != null) {
          _productDetail = result;
        }
        return GetProductDetailSucess(result, selectedOptionId: event.selectedOptionId);
      },
    );
  }
}
