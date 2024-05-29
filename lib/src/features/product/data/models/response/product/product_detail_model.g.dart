// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['description'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['starNum'] as num).toDouble(),
      (json['sellingNum'] as num).toInt(),
      (json['categoryId'] as num).toInt(),
      (json['shopId'] as num).toInt(),
      (json['addressId'] as num).toInt(),
      (json['propertyValues'] as List<dynamic>)
          .map((e) => PropertyValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['options'] as List<dynamic>)
          .map((e) => ProductOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      (json['id'] as num).toInt(),
      json['link'] as String,
      json['description'] as String?,
    );

PropertyValueModel _$PropertyValueModelFromJson(Map<String, dynamic> json) =>
    PropertyValueModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['value'] as String,
      (json['propertyId'] as num).toInt(),
    );

ProductOptionModel _$ProductOptionModelFromJson(Map<String, dynamic> json) =>
    ProductOptionModel(
      (json['id'] as num).toInt(),
      json['name'] as String?,
      (json['propertyValues'] as List<dynamic>)
          .map((e) => PropertyValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['price'] as num).toDouble(),
      (json['remainingNum'] as num).toInt(),
    );
