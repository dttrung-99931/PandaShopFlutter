// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'delivery_progress_response_model.g.dart';

@JsonSerializable(createToJson: false)
class DeliveryProgressResponseModel {
  final int distanceInMetter;
  final int remainingDistance;
  final int durationInMinute;
  final double driverLat;
  final double driverLong;
  final double driverBearingInDegree;

  DeliveryProgressResponseModel({
    required this.distanceInMetter,
    required this.remainingDistance,
    required this.durationInMinute,
    required this.driverLat,
    required this.driverLong,
    required this.driverBearingInDegree,
  });

  factory DeliveryProgressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryProgressResponseModelFromJson(json);
}
