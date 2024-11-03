// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_with_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryWithOrdersResponseModel _$DeliveryWithOrdersResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryWithOrdersResponseModel(
      id: (json['id'] as num).toInt(),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryPartnerUnitAddress: AddressModel.fromJson(
          json['deliveryPartnerUnitAddress'] as Map<String, dynamic>),
    );
