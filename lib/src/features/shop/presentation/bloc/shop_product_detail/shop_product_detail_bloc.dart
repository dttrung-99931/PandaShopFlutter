// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/src/bloc.dart';
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_detail_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'shop_product_detail_event.dart';
part 'shop_product_detail_state.dart';

ShopProductDetailBloc get shopProductDetailBloc => getIt();

@lazySingleton
class ShopProductDetailBloc extends BaseBloc {
  ShopProductDetailBloc(this._getProductDetail) : super(InitialState()) {
    on<OnInitShopProduct>(_onInitShopProduct);
  }
  final GetProductDetailUseCase _getProductDetail;
  final productNameController = TextEditingController();
  final productDescController = TextEditingController();

  FutureOr<void> _onInitShopProduct(OnInitShopProduct event, Emitter<BaseState> emit) async {
    if (event.productId != null) {
      await handleUsecaseResult(
        usecaseResult: _getProductDetail.call(event.productId!),
        emit: emit,
        onSuccess: (ProductDetailDto? result) {
          if (result != null) {
            _init(result);
            emit(InitShopProductSuccess(productDetail: result));
          }
        },
      );
    } else {
      _init(null);
      emit(InitShopProductSuccess(productDetail: null));
    }
  }

  void _init(ProductDetailDto? result) {
    productNameController.text = 'Product name';
  }
}