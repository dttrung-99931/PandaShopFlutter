// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsRequestModel _$GetProductsRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsRequestModel(
      categoryIdLV1: (json['categoryIdLV1'] as num?)?.toInt(),
      categoryIdLV2: (json['categoryIdLV2'] as num?)?.toInt(),
      categoryIdLV3: (json['categoryIdLV3'] as num?)?.toInt(),
      q: json['q'] as String?,
      orderBy: json['orderBy'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$GetProductsRequestModelToJson(
    GetProductsRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('q', instance.q);
  writeNotNull('categoryIdLV1', instance.categoryIdLV1);
  writeNotNull('categoryIdLV2', instance.categoryIdLV2);
  writeNotNull('categoryIdLV3', instance.categoryIdLV3);
  writeNotNull('orderBy', instance.orderBy);
  writeNotNull('shopId', instance.shopId);
  writeNotNull('available', instance.available);
  return val;
}
