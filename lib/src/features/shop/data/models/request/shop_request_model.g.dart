// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopRequestModel _$ShopRequestModelFromJson(Map<String, dynamic> json) =>
    ShopRequestModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ShopRequestModelToJson(ShopRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
    };
