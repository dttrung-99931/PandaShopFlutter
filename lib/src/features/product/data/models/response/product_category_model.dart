import 'package:json_annotation/json_annotation.dart';

part 'product_category_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductCategoryModel {
  final int id;
  final String name;
  final String? imgLink;
  final int? templateId;
  final int level;
  final int? parentId;

  ProductCategoryModel(
    this.id,
    this.name,
    this.imgLink,
    this.templateId,
    this.level,
    this.parentId,
  );

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => _$ProductCategoryModelFromJson(json);
}
