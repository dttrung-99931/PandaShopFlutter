import 'package:evievm_app/src/features/product/data/models/response/product_category_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/short_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_product_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class SearchProductModel {
  final List<ProductCategoryModel> categories;
  final List<ShortProductModel> products;

  SearchProductModel(this.categories, this.products);

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => _$SearchProductModelFromJson(json);
}
