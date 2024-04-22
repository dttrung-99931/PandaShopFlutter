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

class OnProcessOrder extends BaseEvent {
  OnProcessOrder({
    required this.order,
  });
  final OrderDto order;

  @override
  List<Object?> get props => [order];
}

class OnStartProcessingOrder extends OnProcessOrder {
  OnStartProcessingOrder({required super.order});
}

class OnStartCompleteProcessingOrder extends OnProcessOrder {
  OnStartCompleteProcessingOrder({required super.order});
}

class OnCancelOrder extends OnProcessOrder {
  OnCancelOrder({required super.order});
}
