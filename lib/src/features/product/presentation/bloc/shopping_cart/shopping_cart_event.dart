// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_cart_bloc.dart';

class OnGetShoppingCart extends BaseEvent {
  final int id;

  OnGetShoppingCart(this.id);

  @override
  List<Object?> get props => [id];
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
