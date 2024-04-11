// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    WarehouseModel(
      id: json['id'] as int?,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
