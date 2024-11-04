// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_progress_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryProgressResponseModel _$DeliveryProgressResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryProgressResponseModel(
      distanceInMetter: (json['distanceInMetter'] as num).toInt(),
      remainingDistance: (json['remainingDistance'] as num).toInt(),
      durationInMinute: (json['durationInMinute'] as num).toInt(),
      driverLat: (json['driverLat'] as num).toDouble(),
      driverLong: (json['driverLong'] as num).toDouble(),
      driverBearingInDegree: (json['driverBearingInDegree'] as num).toDouble(),
    );
