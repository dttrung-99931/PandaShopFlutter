// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'create_product_request_model.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class CreateProductRequestModel {
  final int? id;
  final String name;
  final String description;
  final int sellingNum;
  final int categoryId;
  final int shopId;
  final int addressId;
  final List<ProductOptionRequestModel> productOptions;
  final List<PropertyValueRequestModel> properties;

  CreateProductRequestModel({
    this.id,
    required this.name,
    required this.description,
    required this.sellingNum,
    required this.categoryId,
    required this.shopId,
    required this.addressId,
    required this.productOptions,
    required this.properties,
  });

  Map<String, dynamic> toJson() => _$CreateProductRequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false, createFactory: false)
class ProductOptionRequestModel {
  final int? id;
  final String name;
  final double price;
  final List<PropertyValueRequestModel> properties;

  ProductOptionRequestModel({
    this.id,
    required this.name,
    required this.price,
    required this.properties,
  });

  Map<String, dynamic> toJson() => _$ProductOptionRequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false, createFactory: false)
class PropertyValueRequestModel {
  final int? id;
  final int propertyId;
  final String value;

  PropertyValueRequestModel({
    this.id,
    required this.propertyId,
    required this.value,
  });

  Map<String, dynamic> toJson() => _$PropertyValueRequestModelToJson(this);
}
