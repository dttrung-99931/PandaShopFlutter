import 'package:evievm_app/src/features/product/data/models/response/short_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto {
  final int id;
  final String name;
  final double price;
  final double originalPrice;
  final String? thumbnailUrl;

  ProductDto({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.thumbnailUrl,
  });

  factory ProductDto.fromModel(ShortProductModel model) {
    return ProductDto(
      id: model.id,
      name: model.name,
      price: model.firstPrice,
      originalPrice: model.firstPrice,
      thumbnailUrl: model.thumbImgLink,
    );
  }
}
