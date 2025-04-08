import 'package:evievm_app/core/dtos/loading_dto.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto extends LoadingDto {
  const ProductDto({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.thumbnailUrl,
  });

  final int id;
  final String name;
  final double price;
  final double originalPrice;
  final String? thumbnailUrl;

  @override
  bool get isLoading => id == loading.id;

  static const loading = ProductDto(
    id: 0,
    name: '',
    price: 0.0,
    originalPrice: 0.0,
    thumbnailUrl: '',
  );

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
