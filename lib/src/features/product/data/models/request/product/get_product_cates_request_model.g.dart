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
        GetProductCatesRequestModel instance) =>
    <String, dynamic>{
      if (instance.level case final value?) 'level': value,
      if (instance.parentId case final value?) 'parentId': value,
      if (instance.q case final value?) 'q': value,
      if (instance.shopId case final value?) 'shopId': value,
    };
