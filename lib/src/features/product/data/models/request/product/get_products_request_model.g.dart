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
        GetProductsRequestModel instance) =>
    <String, dynamic>{
      if (instance.q case final value?) 'q': value,
      if (instance.categoryIdLV1 case final value?) 'categoryIdLV1': value,
      if (instance.categoryIdLV2 case final value?) 'categoryIdLV2': value,
      if (instance.categoryIdLV3 case final value?) 'categoryIdLV3': value,
      if (instance.orderBy case final value?) 'orderBy': value,
      if (instance.shopId case final value?) 'shopId': value,
      if (instance.available case final value?) 'available': value,
    };
