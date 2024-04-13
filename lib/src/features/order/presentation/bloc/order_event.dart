// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

class OnGetOrderComfirm extends BaseEvent {
  OnGetOrderComfirm({
    required this.items,
  });
  final List<CartItemDto> items;

  @override
  List<Object?> get props => [items];
}

class OnChangeDeliveryMethod extends BaseEvent {
  final DeliveryMethodDto deliveryMethod;
  final ShopDto shop;
  OnChangeDeliveryMethod({
    required this.deliveryMethod,
    required this.shop,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
