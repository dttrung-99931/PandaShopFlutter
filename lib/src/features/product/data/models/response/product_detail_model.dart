import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailModel {
  final int id;
  final String name;
  final String description;
  final List<ImageModel> images;

  ProductDetailModel(this.id, this.name, this.description, this.images);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImageModel {
  @JsonKey(name: 'medium_url')
  final String mediumUrl;

  @JsonKey(name: 'large_url')
  final String largeUrl;

  ImageModel(this.mediumUrl, this.largeUrl);

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
