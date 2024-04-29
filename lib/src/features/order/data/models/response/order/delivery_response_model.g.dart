// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryResponseModel _$DeliveryResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryResponseModel(
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      deliveryMethod: DeliveryMethodModel.fromJson(
          json['deliveryMethod'] as Map<String, dynamic>),
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.created: 1,
  DeliveryStatus.findingDriver: 4,
  DeliveryStatus.foundDriver: 6,
  DeliveryStatus.movingToShop: 8,
  DeliveryStatus.receivingProduct: 12,
  DeliveryStatus.delivering: 16,
  DeliveryStatus.delivered: 20,
  DeliveryStatus.cancelled: 24,
  DeliveryStatus.lose: 28,
  DeliveryStatus.productBroken: 32,
};

ShortDeliveryResponseModel _$ShortDeliveryResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShortDeliveryResponseModel(
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
    );
