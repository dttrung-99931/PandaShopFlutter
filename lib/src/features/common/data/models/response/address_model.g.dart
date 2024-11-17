// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      (json['id'] as num).toInt(),
      json['provinceOrCity'] as String,
      json['provinceOrCityCode'] as String,
      json['district'] as String,
      json['districtCode'] as String,
      json['communeOrWard'] as String,
      json['streetAndHouseNum'] as String,
      json['name'] as String?,
      (json['lat'] as num).toDouble(),
      (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provinceOrCity': instance.provinceOrCity,
      'provinceOrCityCode': instance.provinceOrCityCode,
      'district': instance.district,
      'districtCode': instance.districtCode,
      'communeOrWard': instance.communeOrWard,
      'streetAndHouseNum': instance.streetAndHouseNum,
      'name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
    };
