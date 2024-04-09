// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class ProductDetailModel {
  final int id;
  final String name;
  final String description;
  final double starNum;
  final int sellingNum;
  final int remainingNum;
  final int categoryId;
  final int shopId;
  final int addressId;
  final List<ImageModel> images;
  final List<PropertyValueModel> propertyValues;
  final List<ProductOptionModel> options;

  ProductDetailModel(
    this.id,
    this.name,
    this.description,
    this.images,
    this.starNum,
    this.sellingNum,
    this.remainingNum,
    this.categoryId,
    this.shopId,
    this.addressId,
    this.propertyValues,
    this.options,
  );

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => _$ProductDetailModelFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class ImageModel {
  final int id;
  final String link;
  final String? description;

  ImageModel(this.id, this.link, this.description);

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class PropertyValueModel {
  final int id;
  final String name;
  final String value;
  final int propertyId;

  PropertyValueModel(this.id, this.name, this.value, this.propertyId);

  factory PropertyValueModel.fromJson(Map<String, dynamic> json) => _$PropertyValueModelFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class ProductOptionModel {
  final int id;
  final String? name;
  final List<PropertyValueModel> propertyValues;
  final double price;
  final int remainingNum;

  ProductOptionModel(
    this.id,
    this.name,
    this.propertyValues,
    this.price,
    this.remainingNum,
  );

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) => _$ProductOptionModelFromJson(json);
}
