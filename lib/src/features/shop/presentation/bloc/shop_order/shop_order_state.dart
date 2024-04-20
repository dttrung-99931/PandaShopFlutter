// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_order_bloc.dart';

class ShoppingCartUpdated extends FullDataLoadedState<ShoppingCartDto> {
  ShoppingCartUpdated(super.data);
}

class GetShoppingCartSuccess extends ShoppingCartUpdated {
  GetShoppingCartSuccess(super.data);
}

class UpsertShoppingCartSuccess extends ShoppingCartUpdated {
  final bool isFirstAdd;
  UpsertShoppingCartSuccess(
    super.data, {
    required this.isFirstAdd,
  });
}

class DeleteCartItemsSuccess extends LoadingCompleteStateWithoutProps {}

class LoadingProducts extends LoadingState {}

class LoadingShoppingCart extends LoadingState {}
