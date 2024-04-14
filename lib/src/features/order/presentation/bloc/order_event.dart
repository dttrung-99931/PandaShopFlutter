// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

class OnCreateOrderInput extends BaseEvent {
  OnCreateOrderInput({
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
  List<Object?> get props => [deliveryMethod, shop];
}

class OnChangePaymentMethod extends BaseEvent {
  final PaymentMethodDto paymentMethod;
  OnChangePaymentMethod({
    required this.paymentMethod,
  });
  @override
  List<Object?> get props => [paymentMethod];
}

class OnCreateOrder extends BaseEventWithoutProps {}

class OnChangeAddress extends BaseEvent {
  final AddressDto address;
  final ShopDto shop;
  OnChangeAddress({
    required this.address,
    required this.shop,
  });
  @override
  List<Object?> get props => [address, shop];
}
