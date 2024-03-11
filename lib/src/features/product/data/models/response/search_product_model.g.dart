// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductModel _$SearchProductModelFromJson(Map<String, dynamic> json) =>
    SearchProductModel(
      (json['categories'] as List<dynamic>)
          .map((e) => ProductCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
