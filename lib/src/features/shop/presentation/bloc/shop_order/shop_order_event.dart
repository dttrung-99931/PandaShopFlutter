// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_order_bloc.dart';

class OnGetShopOrders extends BaseEventWithoutProps {}

class OnGetShoppingCartById extends BaseEvent {
  final int id;
  final bool clearSelectedItems;

  OnGetShoppingCartById(
    this.id, {
    this.clearSelectedItems = false,
  });

  @override
  List<Object?> get props => [id, clearSelectedItems];
}

class OnUpsertCart extends BaseEvent {
  final UpsertCartRequestModel requestModel;

  OnUpsertCart({required this.requestModel});

  @override
  List<Object?> get props => [requestModel];
}

class OnCheckCartItem extends BaseEvent {
  final CartItemDto item;
  final bool isChecked;

  OnCheckCartItem({
    required this.item,
    required this.isChecked,
  });

  @override
  List<Object?> get props => [item, isChecked];
}

class OnDeleteCartItems extends BaseEvent {
  final List<CartItemDto> items;
  OnDeleteCartItems({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}
