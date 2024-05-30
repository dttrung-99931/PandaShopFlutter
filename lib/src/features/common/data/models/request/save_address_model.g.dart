// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveAddressRequestModel _$SaveAddressRequestModelFromJson(
        Map<String, dynamic> json) =>
    SaveAddressRequestModel(
      provinceOrCity: json['provinceOrCity'] as String,
      provinceOrCityCode: json['provinceOrCityCode'] as String,
      district: json['district'] as String,
      districtCode: json['districtCode'] as String,
      communeOrWard: json['communeOrWard'] as String,
      streetAndHouseNum: json['streetAndHouseNum'] as String,
      name: json['name'] as String?,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$SaveAddressRequestModelToJson(
        SaveAddressRequestModel instance) =>
    <String, dynamic>{
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
