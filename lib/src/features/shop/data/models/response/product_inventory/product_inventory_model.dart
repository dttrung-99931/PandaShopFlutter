// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/product/data/models/response/product/product_detail_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';

part 'product_inventory_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class ProductInventoryModel {
  final ShortProductModel product;
  final List<ProductOptionInvetoryModel> optionInventories;

  ProductInventoryModel({
    required this.product,
    required this.optionInventories,
  });

  factory ProductInventoryModel.fromJson(Map<String, dynamic> json) => _$ProductInventoryModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductOptionInvetoryModel {
  final ProductOptionModel productOption;
  final int number;

  ProductOptionInvetoryModel({
    required this.productOption,
    required this.number,
  });

  factory ProductOptionInvetoryModel.fromJson(Map<String, dynamic> json) => _$ProductOptionInvetoryModelFromJson(json);
}
