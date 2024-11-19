// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_delivery_tracking_bloc.dart';

class OnStartDeliveryTracking extends BaseEvent {
  final MapTrackingOptions options;
  final int deliveryId;

  OnStartDeliveryTracking({
    required this.options,
    required this.deliveryId,
  });

  @override
  List<Object?> get props => [options, deliveryId];
}

class OnStopDeliveryTracking extends BaseEventWithoutProps {}

class OnMapDeliveryProgressUpdate extends BaseEvent {
  final DeliveryProgressUpdateDto progress;

  OnMapDeliveryProgressUpdate(this.progress);

  @override
  List<Object?> get props => [progress];
}
