import '../../data/models/response/product_detail_model.dart';

class ProductDetailDto {
  final int id;
  final String name;
  final String description;
  final List<ImageDto> images;
  final List<PropertyValueDto> propertyValues;
  final List<ProductOptionDto> options;

  // Map<propertyName, values>
  Map<String, Set<String>> get optionProperties {
    Map<String, Set<String>> map = {};
    for (ProductOptionDto option in options) {
      for (PropertyValueDto prop in option.propertyValues) {
        map[prop.name] ??= {};
        map[prop.name]!.add(prop.value);
      }
    }
    return map;
  }

  ProductDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.propertyValues,
    required this.options,
  });

  factory ProductDetailDto.fromModel(ProductDetailModel model) {
    return ProductDetailDto(
      id: model.id,
      name: model.name,
      description: model.description,
      images: model.images.map((e) => ImageDto.fromModel(e)).toList(),
      propertyValues: PropertyValueDto.fromList(model.propertyValues),
      options: ProductOptionDto.fromList(model.options),
    );
  }
}

class ImageDto {
  final String link;
  final String? description;

  ImageDto({required this.link, required this.description});

  factory ImageDto.fromModel(ImageModel model) {
    return ImageDto(link: model.link, description: model.description);
  }

  static List<ImageDto> fromList(List<ImageModel> models) {
    return models.map((e) => ImageDto.fromModel(e)).toList();
  }
}

class PropertyValueDto {
  final int id;
  final String name;
  final String value;

  PropertyValueDto({required this.id, required this.name, required this.value});

  factory PropertyValueDto.fromModel(PropertyValueModel model) {
    return PropertyValueDto(id: model.id, name: model.name, value: model.value);
  }

  static List<PropertyValueDto> fromList(List<PropertyValueModel> models) {
    return models.map((e) => PropertyValueDto.fromModel(e)).toList();
  }
}

class ProductOptionDto {
  final int id;
  final String? name;
  final List<PropertyValueDto> propertyValues;
  final double price;

  ProductOptionDto({
    required this.id,
    required this.name,
    required this.propertyValues,
    required this.price,
  });

  factory ProductOptionDto.fromModel(ProductOptionModel model) {
    return ProductOptionDto(
      id: model.id,
      name: model.name,
      propertyValues: PropertyValueDto.fromList(model.propertyValues),
      price: model.price,
    );
  }

  static List<ProductOptionDto> fromList(List<ProductOptionModel> models) {
    return models.map((e) => ProductOptionDto.fromModel(e)).toList();
  }
}
