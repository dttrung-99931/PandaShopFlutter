// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_cart_bloc.dart';

class GetShoppingCartSuccess extends FullDataLoadedState<ShoppingCartDto> {
  GetShoppingCartSuccess(super.data);
}

class LoadingProducts extends LoadingState {}

class LoadingProductDetail extends LoadingState {}
