// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/home/home_banner_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_cates_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

import '../../../product/domain/dto/product_dto.dart';

part 'home_event.dart';
part 'home_state.dart';

HomeBloc get homeBloc => getIt<HomeBloc>();

@lazySingleton
class HomeBloc extends BaseBloc {
  final GetProductsUseCase _getProducts;
  final GetProductCatesUseCase _getProductCates;
  final GetHomeBannersUseCase _getHomeBanners;

  HomeBloc(this._getProducts, this._getProductCates, this._getHomeBanners) : super(InitialState()) {
    onLoad<OnGetHomeProducts>(_onGetHomeProducts);
    onLoad<OnGetHomeProductCates>(_onGetHomeProductCates);
    on<OnGetHomeBanners>(_onGetHomeBanners);
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

  FutureOr<void> _onGetHomeBanners(OnGetHomeBanners event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getHomeBanners.call(noParam),
      emit: emit,
      onSuccess: (List<HomeBannerDto> result) {
        return GetHomeBannersSucess(result);
      },
    );
  }
}
