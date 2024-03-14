// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_cart_bloc.dart';

class GetShoppingCartSuccess extends FullDataLoadedState<ShoppingCartDto> {
  GetShoppingCartSuccess(super.data);
}

class CartItemsChecked extends FullDataLoadedState<ShoppingCartDto> {
  CartItemsChecked(super.data);
}

class UpsertShoppingCartSuccess extends LoadingCompleteStateWithoutProps {}

class DeleteCartItemsSuccess extends LoadingCompleteStateWithoutProps {}

class LoadingProducts extends LoadingState {}

class LoadingProductDetail extends LoadingState {}
