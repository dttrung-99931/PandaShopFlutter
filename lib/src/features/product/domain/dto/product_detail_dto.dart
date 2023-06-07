import '../../data/models/response/product_detail_model.dart';

class ProductDetailDto {
  final int id;
  final String name;
  final String description;
  final List<ImageDto> images;

  ProductDetailDto({required this.id, required this.name, required this.description, required this.images});

  factory ProductDetailDto.fromModel(ProductDetailModel model) {
    return ProductDetailDto(
      id: model.id,
      name: model.name,
      description: model.description,
      images: model.images.map((e) => ImageDto.fromModel(e)).toList(),
    );
  }
}

class ImageDto {
  final String mediumUrl;
  final String largeUrl;

  ImageDto({required this.mediumUrl, required this.largeUrl});

  factory ImageDto.fromModel(ImageModel model) {
    return ImageDto(mediumUrl: model.mediumUrl, largeUrl: model.largeUrl);
  }
}
