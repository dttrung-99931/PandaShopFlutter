// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseRequestModel _$WarehouseRequestModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseRequestModel(
      id: (json['id'] as num?)?.toInt(),
      addressId: (json['addressId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$WarehouseRequestModelToJson(
        WarehouseRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'addressId': instance.addressId,
      'name': instance.name,
    };
