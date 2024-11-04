// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_progress_response_model.dart';

class DeliveryProgressDto {
  DeliveryProgressDto({
    required this.distanceInMetter,
    required this.remainingDistance,
    required this.durationInMinute,
    required this.driverLat,
    required this.driverLong,
    required this.driverBearingInDegree,
  });
  final int distanceInMetter;
  final int remainingDistance;
  final int durationInMinute;
  final double driverLat;
  final double driverLong;
  final double driverBearingInDegree;

  factory DeliveryProgressDto.fromModel(DeliveryProgressResponseModel model) {
    return DeliveryProgressDto(
      distanceInMetter: model.distanceInMetter,
      remainingDistance: model.remainingDistance,
      durationInMinute: model.durationInMinute,
      driverLat: model.driverLat,
      driverLong: model.driverLong,
      driverBearingInDegree: model.driverBearingInDegree,
    );
  }
}
