// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateProductRequestModelToJson(
        CreateProductRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'description': instance.description,
      'sellingNum': instance.sellingNum,
      'categoryId': instance.categoryId,
      'shopId': instance.shopId,
      'addressId': instance.addressId,
      'productOptions': instance.productOptions,
      'properties': instance.properties,
    };

Map<String, dynamic> _$ProductOptionRequestModelToJson(
        ProductOptionRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'price': instance.price,
      'properties': instance.properties,
    };

Map<String, dynamic> _$PropertyValueRequestModelToJson(
        PropertyValueRequestModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'propertyId': instance.propertyId,
      'value': instance.value,
    };
