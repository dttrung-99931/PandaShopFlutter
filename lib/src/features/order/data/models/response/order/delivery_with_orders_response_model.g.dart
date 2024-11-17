// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_with_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryWithOrdersResponseModel _$DeliveryWithOrdersResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryWithOrdersResponseModel(
      id: (json['id'] as num).toInt(),
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      progress: json['progress'] == null
          ? null
          : DeliveryProgressResponseModel.fromJson(
              json['progress'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryPartnerUnitAddress: AddressModel.fromJson(
          json['deliveryPartnerUnitAddress'] as Map<String, dynamic>),
      deliveryLocations: (json['deliveryLocations'] as List<dynamic>)
          .map((e) =>
              DeliveryLocationResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
