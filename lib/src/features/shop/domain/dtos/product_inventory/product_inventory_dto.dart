// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/shop/data/models/response/product_inventory/product_inventory_model.dart';

class ProductInventoryDto {
  ProductInventoryDto({
    required this.product,
    required this.optionInventories,
  });
  final ProductDto product;
  final List<ProductOptionInvetoryDto> optionInventories;

  factory ProductInventoryDto.fromModel(ProductInventoryModel model) {
    return ProductInventoryDto(
      product: ProductDto.fromModel(model.product),
      optionInventories: model.optionInventories.mapList((element) => ProductOptionInvetoryDto.fromModel(element)),
    );
  }
}

class ProductOptionInvetoryDto {
  ProductOptionInvetoryDto({
    required this.productOption,
    required this.number,
  });
  final ProductOptionDto productOption;
  final int number;

  factory ProductOptionInvetoryDto.fromModel(ProductOptionInvetoryModel model) {
    return ProductOptionInvetoryDto(
      productOption: ProductOptionDto.fromModel(model.productOption),
      number: model.number,
    );
  }
}
