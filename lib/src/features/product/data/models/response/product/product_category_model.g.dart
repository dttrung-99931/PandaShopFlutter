// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imgLink'] as String?,
      (json['templateId'] as num?)?.toInt(),
      (json['level'] as num).toInt(),
      (json['parentId'] as num?)?.toInt(),
    );
