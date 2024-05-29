// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortProductModel _$ShortProductModelFromJson(Map<String, dynamic> json) =>
    ShortProductModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['firstPrice'] as num).toDouble(),
      json['thumbImgLink'] as String?,
      json['sentFrom'] as String?,
      (json['sellingNum'] as num).toInt(),
      (json['remainingNum'] as num).toInt(),
      (json['starNum'] as num).toDouble(),
    );

Map<String, dynamic> _$ShortProductModelToJson(ShortProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstPrice': instance.firstPrice,
      'thumbImgLink': instance.thumbImgLink,
      'sentFrom': instance.sentFrom,
      'sellingNum': instance.sellingNum,
      'remainingNum': instance.remainingNum,
      'starNum': instance.starNum,
    };
