import 'package:evievm_app/src/features/product/data/models/response/product_category_model.dart';

class ProductCategoryDto {
  final int id;
  final String name;
  final String? imgLink;
  final int? templateId;
  final int level;

  int? get categoryIdLV1 => level == 1 ? id : null;
  int? get categoryIdLV2 => level == 2 ? id : null;
  int? get categoryIdLV3 => level == 3 ? id : null;

  ProductCategoryDto({
    required this.id,
    required this.name,
    required this.imgLink,
    required this.templateId,
    required this.level,
  });

  factory ProductCategoryDto.fromModel(ProductCategoryModel model) {
    return ProductCategoryDto(
      id: model.id,
      name: model.name,
      imgLink: model.imgLink,
      templateId: model.templateId,
      level: model.level,
    );
  }
}
