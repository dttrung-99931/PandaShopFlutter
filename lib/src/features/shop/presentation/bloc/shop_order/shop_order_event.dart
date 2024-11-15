// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_order_bloc.dart';

class OnGetShopOrders extends BaseEvent {
  final OrderStatus? orderStatus;

  OnGetShopOrders({
    this.orderStatus,
  });

  @override
  List<Object?> get props => [orderStatus];
}

class OnSelectOrderStatus extends OnSelect<OrderStatus> {
  OnSelectOrderStatus({required super.selected});
}

class OnDriverTakeDelivery extends BaseEvent {
  OnDriverTakeDelivery(
    this.deliveryWithOrders,
  );
  final DeliveryWithOrdersResponseDto deliveryWithOrders;

  @override
  List<Object?> get props => [deliveryWithOrders];
}
