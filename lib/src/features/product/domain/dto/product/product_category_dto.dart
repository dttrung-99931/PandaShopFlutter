import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';

class ProductCategoryDto {
  ProductCategoryDto({
    required this.id,
    required this.name,
    required this.imgLink,
    required this.templateId,
    required this.level,
    required this.parentId,
  });
  static ProductCategoryDto emptyLv1 = ProductCategoryDto(
    id: Constants.idEmpty,
    name: '- Lựa chọn -',
    imgLink: '',
    templateId: Constants.idEmpty,
    level: 1,
    parentId: Constants.idEmpty - 1,
  );
  static ProductCategoryDto emptyLv2 = ProductCategoryDto(
    id: Constants.idEmpty,
    name: '- Lựa chọn -',
    imgLink: '',
    templateId: Constants.idEmpty,
    level: 2,
    parentId: Constants.idEmpty - 1,
  );
  static ProductCategoryDto emptyLv3 = ProductCategoryDto(
    id: Constants.idEmpty,
    name: '- Lựa chọn -',
    imgLink: '',
    templateId: Constants.idEmpty,
    level: 3,
    parentId: Constants.idEmpty - 1,
  );

  final int id;
  final String name;
  final String? imgLink;
  final int? templateId;
  final int level;
  final int? parentId;

  int? get categoryIdLV1 => level == 1 ? id : null;
  int? get categoryIdLV2 => level == 2 ? id : null;
  int? get categoryIdLV3 => level == 3 ? id : null;

  factory ProductCategoryDto.fromModel(ProductCategoryModel model) {
    return ProductCategoryDto(
      id: model.id,
      name: model.name,
      imgLink: model.imgLink,
      templateId: model.templateId,
      level: model.level,
      parentId: model.parentId,
    );
  }
}
