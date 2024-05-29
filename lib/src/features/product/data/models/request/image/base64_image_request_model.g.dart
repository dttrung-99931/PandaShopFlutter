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
    );

Map<String, dynamic> _$Base64ImageRequestModelToJson(
    Base64ImageRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['based64Img'] = instance.based64Img;
  val['orderIndex'] = instance.orderIndex;
  val['description'] = instance.description;
  return val;
}
