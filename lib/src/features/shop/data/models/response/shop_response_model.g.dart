// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopResponseModel _$ShopResponseModelFromJson(Map<String, dynamic> json) =>
    ShopResponseModel(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ShopResponseModelToJson(ShopResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
