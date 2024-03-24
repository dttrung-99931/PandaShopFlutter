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
