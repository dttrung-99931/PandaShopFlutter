import 'package:evievm_app/src/features/product/data/models/response/search_product_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';

class SearchProductDto {
  final List<ProductCategoryDto> categories;
  final List<ProductDto> products;
  SearchProductDto({
    required this.categories,
    required this.products,
  });

  factory SearchProductDto.fromModel(SearchProductModel model) {
    return SearchProductDto(
      products: model.products.map((e) => ProductDto.fromModel(e)).toList(),
      categories: model.categories.map((e) => ProductCategoryDto.fromModel(e)).toList(),
    );
  }
}
