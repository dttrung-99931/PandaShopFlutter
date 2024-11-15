// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'signalr_bloc.dart';

class SignalRNotificationReceived extends NotificationReceived {
  SignalRNotificationReceived(super.data);
}

class SinalRDeliveryProgressUpdate extends BaseState {
  final DeliveryProgressUpdateDto progressUpdate;
  SinalRDeliveryProgressUpdate({required this.progressUpdate});

  @override
  List<Object?> get props => [progressUpdate];
}

class SinalRDriverTakeDelivery extends BaseState {
  final DeliveryWithOrdersResponseDto deliveryWithOrders;
  SinalRDriverTakeDelivery(this.deliveryWithOrders);

  @override
  List<Object?> get props => [deliveryWithOrders];
}
