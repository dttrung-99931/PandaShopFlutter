// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_input_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseInputRequestModel _$WarehouseInputRequestModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseInputRequestModel(
      id: (json['id'] as num?)?.toInt(),
      warehouseId: (json['warehouseId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WarehouseInputRequestModelToJson(
        WarehouseInputRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'warehouseId': instance.warehouseId,
      'date': instance.date.toIso8601String(),
    };
