// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInventoryModel _$ProductInventoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductInventoryModel(
      product:
          ShortProductModel.fromJson(json['product'] as Map<String, dynamic>),
      optionInventories: (json['optionInventories'] as List<dynamic>)
          .map((e) =>
              ProductOptionInvetoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ProductOptionInvetoryModel _$ProductOptionInvetoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductOptionInvetoryModel(
      productOption: ProductOptionModel.fromJson(
          json['productOption'] as Map<String, dynamic>),
      number: (json['number'] as num).toInt(),
    );
