part of 'home_bloc.dart';

class LogoutSuccess extends LoadingCompleteStateWithoutProps {}

class GetProductsSucess extends FullDataLoadedState<List<ProductDto>> {
  GetProductsSucess(super.data);
}

class GetProductCatesSucess extends FullDataLoadedState<List<ProductCategoryDto>> {
  GetProductCatesSucess(super.data);
}
