import 'package:evievm_app/src/features/product/data/models/response/product_detail_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

abstract class BaseImageDto {
  ImageProvider get imageProvider;
  BaseImageDto();
}

class ImageDto extends BaseImageDto {
  ImageDto({required this.link, required this.description});
  final String link;
  final String? description;

  factory ImageDto.fromModel(ImageModel model) {
    return ImageDto(link: model.link, description: model.description);
  }

  static List<ImageDto> fromList(List<ImageModel> models) {
    return models.map((e) => ImageDto.fromModel(e)).toList();
  }

  @override
  ImageProvider<Object> get imageProvider => ExtendedNetworkImageProvider(link);
}
