// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressFieldModel _$AddressFieldModelFromJson(Map<String, dynamic> json) =>
    AddressFieldModel(
      json['name'] as String,
      json['code'] as String,
      json['name_with_type'] as String,
    );

Map<String, dynamic> _$AddressFieldModelToJson(AddressFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'name_with_type': instance.path,
    };
