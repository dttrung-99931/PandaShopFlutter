// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_products_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/home/home_banner_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/product/delete_product_usecase.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';

part 'shop_product_event.dart';
part 'shop_product_state.dart';

ShopProductBloc get shopProductBloc => getIt<ShopProductBloc>();

@lazySingleton
class ShopProductBloc extends BaseBloc {
  ShopProductBloc(
    this._getProducts,
    this._getProductCates,
    this._getHomeBanners,
    this._deleteProduct,
  ) : super(InitialState()) {
    onLoad<OnGetShopProducts>(_onGetHomeProducts);
    onLoad<OnGetShopProductCates>(
      _onGetHomeProductCates,
      loadingStateBuilder: (_) => LoadingShopProductCates(),
    );
    on<OnGetShopBanners>(_onGetHomeBanners);
    on<OnDeleteProduct>(_onDeleteProduct);
  }
  final GetProductsUseCase _getProducts;
  final GetProductCatesUseCase _getProductCates;
  final GetHomeBannersUseCase _getHomeBanners;
  final DeleteProductUseCase _deleteProduct;

  @override
  ShopProductCommunication? get blocCommunication => getIt();

  Future<void> _onGetHomeProducts(OnGetShopProducts event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProducts.call(GetProductsRequestModel(
        shopId: Global.shop?.id,
        orderBy: 'desc',
      )),
      emit: emit,
      onSuccess: (List<ProductDto> result) {
        return GetShopProductsSucess(result);
      },
    );
  }

  FutureOr<void> _onGetHomeProductCates(OnGetShopProductCates event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getProductCates.call(GetProductCatesRequestModel(shopId: Global.shop?.id)),
      emit: emit,
      onSuccess: (List<ProductCategoryDto> result) {
        return GetShopProductCatesSucess(result);
      },
    );
  }

  FutureOr<void> _onGetHomeBanners(OnGetShopBanners event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getHomeBanners.call(noParam),
      emit: emit,
      onSuccess: (List<HomeBannerDto> result) {
        return GetShopBannersSucess(result);
      },
    );
  }

  FutureOr<void> _onDeleteProduct(OnDeleteProduct event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _deleteProduct.call(event.productId),
      emit: emit,
      onSuccess: (void result) {
        return DeleteProductSuccess(productId: event.productId);
      },
    );
  }
}
