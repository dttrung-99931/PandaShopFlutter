// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_cates_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductCatesRequestModel _$GetProductCatesRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetProductCatesRequestModel(
      level: (json['level'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      q: (json['q'] as num?)?.toInt(),
      shopId: (json['shopId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductCatesRequestModelToJson(
    GetProductCatesRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('level', instance.level);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('q', instance.q);
  writeNotNull('shopId', instance.shopId);
  return val;
}
