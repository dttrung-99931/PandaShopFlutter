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
    WarehouseRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['addressId'] = instance.addressId;
  val['name'] = instance.name;
  return val;
}
