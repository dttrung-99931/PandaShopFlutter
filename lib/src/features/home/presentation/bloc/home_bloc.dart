// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_cates_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../product/domain/dto/product_dto.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends BaseBloc {
  final GetProductsUseCase _getProducts;
  final GetProductCatesUseCase _getProductCates;

  HomeBloc(this._getProducts, this._getProductCates) : super(InitialState()) {
    onLoad<OnGetHomeProducts>(_onGetHomeProducts);
    onLoad<OnGetHomeProductCates>(_onGetHomeProductCates);
  }

  Future<void> _onGetHomeProducts(OnGetHomeProducts event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProducts.call(GetProductsRequestModel(orderBy: 'desc')),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetProductsSucess(result);
      },
    );
  }

  FutureOr<void> _onGetHomeProductCates(OnGetHomeProductCates event, Emitter<BaseState> emit) async {
     await handleUsecaseResult(
      usecaseResult: _getProductCates.call(GetProductCatesRequestModel(level: 3)),
      emit: emit,
      onSuccess: (List<ProductCategoryDto> result) {
        return GetProductCatesSucess(result);
      },
    );
  }
}
