// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_product_bloc.dart';

class GetShopProductsSucess extends FullDataLoadedState<List<ProductDto>> {
  GetShopProductsSucess(super.data);
}

class GetShopProductCatesSucess extends FullDataLoadedState<List<ProductCategoryDto>> {
  GetShopProductCatesSucess(super.data);
}

class GetShopBannersSucess extends FullDataLoadedState<List<HomeBannerDto>> {
  GetShopBannersSucess(super.data);
}

class LoadingShopProductCates extends LoadingState {}

class DeleteProductSuccess extends LoadingCompleteState {
  final int productId;
  DeleteProductSuccess({
    required this.productId,
  });
  @override
  List<Object?> get props => [productId];
}
