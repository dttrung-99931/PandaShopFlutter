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

class LoadingShoppingCart extends LoadingState {}

class DisplayOrderStatusesUpdated extends ListLoadedState<OrderStatus, OrderStatus> {
  DisplayOrderStatusesUpdated(super.data, {required super.selectedId});

  @override
  OrderStatus getId(OrderStatus element) {
    return element;
  }
}
