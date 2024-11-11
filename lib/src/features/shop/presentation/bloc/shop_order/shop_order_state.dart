// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_order_bloc.dart';

class GetShopOrdersSuccess extends FullDataLoadedState<List<OrderDto>> {
  final OrderStatus orderStatus;

  Map<AddressDto, List<OrderDto>> get ordersGroupByDeliveryPartnerAddr {
    return data.groupBy((order) => order.customerAddress);
  }

  GetShopOrdersSuccess(
    super.data, {
    required this.orderStatus,
  });

  @override
  List<Object?> get props => [...super.props, orderStatus];
}

class GetCompleteProcessingOrdersSuccess extends FullDataLoadedState<List<TempDeliveryResponseDto>> {
  GetCompleteProcessingOrdersSuccess(
    super.data, {
    required this.orderStatus,
  });
  final OrderStatus orderStatus;
}

class GetWaitingDeliveryPartnerOrdersSuccess extends FullDataLoadedState<List<DeliveryWithOrdersResponseDto>> {
  GetWaitingDeliveryPartnerOrdersSuccess(
    super.data, {
    required this.orderStatus,
  });
  final OrderStatus orderStatus;
}

class GetDeliveringOrdersSuccess extends FullDataLoadedState<List<DeliveryWithOrdersResponseDto>> {
  GetDeliveringOrdersSuccess(
    super.data, {
    required this.orderStatus,
  });
  final OrderStatus orderStatus;
}

class LoadingShoppingCart extends LoadingState {}

class DisplayOrderStatusesUpdated extends ListLoadedState<OrderStatus, OrderStatus> {
  DisplayOrderStatusesUpdated(super.data, {required super.selectedId});

  @override
  OrderStatus getId(OrderStatus element) {
    return element;
  }
}
