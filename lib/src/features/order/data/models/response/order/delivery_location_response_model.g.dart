// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryLocationResponseModel _$DeliveryLocationResponseModelFromJson(Map<String, dynamic> json) =>
    DeliveryLocationResponseModel(
      locationType: $enumDecode(_$DeliveryLocationTypeEnumMap, json['locationType']),
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

const _$DeliveryLocationTypeEnumMap = {
  DeliveryLocationType.pickup: 2,
  DeliveryLocationType.delivery: 4,
  DeliveryLocationType.deliveryPartner: 8,
};
