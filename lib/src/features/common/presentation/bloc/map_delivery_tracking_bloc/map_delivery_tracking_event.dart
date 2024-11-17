// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_delivery_tracking_bloc.dart';

class OnStartDeliveryTracking extends BaseEvent {
  final int deliveryId;

  OnStartDeliveryTracking({
    required this.deliveryId,
  });

  @override
  List<Object?> get props => [deliveryId];
}

class OnStopDeliveryTracking extends BaseEventWithoutProps {}

class OnMapDeliveryProgressUpdate extends BaseEvent {
  final DeliveryProgressUpdateDto progress;

  OnMapDeliveryProgressUpdate(this.progress);

  @override
  List<Object?> get props => [progress];
}
