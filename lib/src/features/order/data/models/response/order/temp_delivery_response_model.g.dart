// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_delivery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempDeliveryResponseModel _$TempDeliveryResponseModelFromJson(
        Map<String, dynamic> json) =>
    TempDeliveryResponseModel(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryPartnerUnitAddress: AddressModel.fromJson(
          json['deliveryPartnerUnitAddress'] as Map<String, dynamic>),
      deliveryPartnerUnitId: (json['deliveryPartnerUnitId'] as num).toInt(),
      deliveryMethodId: (json['deliveryMethodId'] as num).toInt(),
    );
