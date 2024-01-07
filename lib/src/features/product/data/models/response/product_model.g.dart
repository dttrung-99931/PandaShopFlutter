// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as int,
      json['name'] as String,
      (json['firstPrice'] as num).toDouble(),
      json['thumbImgLink'] as String,
      json['sentFrom'] as String,
      json['sellingNum'] as int,
      json['remainingNum'] as int,
      (json['starNum'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
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
