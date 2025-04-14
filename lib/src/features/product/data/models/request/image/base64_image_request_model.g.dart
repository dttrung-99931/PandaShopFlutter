// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base64_image_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base64ImageRequestModel _$Base64ImageRequestModelFromJson(
        Map<String, dynamic> json) =>
    Base64ImageRequestModel(
      id: (json['id'] as num?)?.toInt(),
      based64Img: json['based64Img'] as String,
      orderIndex: (json['orderIndex'] as num).toInt(),
      description: json['description'] as String,
      avgColor: (json['avgColor'] as num).toInt(),
    );

Map<String, dynamic> _$Base64ImageRequestModelToJson(
        Base64ImageRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'based64Img': instance.based64Img,
      'orderIndex': instance.orderIndex,
      'description': instance.description,
      'avgColor': instance.avgColor,
    };
