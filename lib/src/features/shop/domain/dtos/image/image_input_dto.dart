// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/data/models/request/image/base64_image_request_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/src/painting/image_provider.dart';

import 'package:evievm_app/core/utils/encode_utils.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';

import '../../../../../../core/utils/constants.dart';

class ImageInputDto extends BaseImageDto {
  final String based64Img;
  final int orderIndex;
  final String description;

  ImageInputDto({
    required super.id,
    required this.based64Img,
    required this.orderIndex,
    required this.description,
  });

  static ImageInputDto empty = ImageInputDto.fromBase64Image('');

  factory ImageInputDto.fromBase64Image(String base64) {
    return ImageInputDto(
      id: Constatnts.idEmpty,
      based64Img: base64,
      orderIndex: 0,
      description: '',
    );
  }
  factory ImageInputDto.adaptFromImageDto(
    ImageDto image, {
    int orderIndex = 0,
  }) {
    return ImageInputAdaptDto(
      id: image.id,
      based64Img: '',
      orderIndex: orderIndex,
      description: image.description ?? '',
      imageLink: image.link,
    );
  }

  @override
  ImageProvider<Object> get imageProvider => ExtendedMemoryImageProvider(
        decodeBase64(based64Img)!,
      );

  ImageInputDto copyWith({
    String? based64Img,
    int? orderIndex,
    String? description,
    int? id,
  }) {
    return ImageInputDto(
      id: id ?? this.id,
      based64Img: based64Img ?? this.based64Img,
      orderIndex: orderIndex ?? this.orderIndex,
      description: description ?? this.description,
    );
  }

  Base64ImageRequestModel toRequestModel() {
    return Base64ImageRequestModel(
      id: null,
      // Remove base 64 header 'data:image/jpg;base64,'
      based64Img: based64Img.split('base64,').last,
      orderIndex: orderIndex,
      description: description,
    );
  }
}

class ImageInputAdaptDto extends ImageInputDto {
  ImageInputAdaptDto({
    required super.id,
    super.based64Img = '',
    required super.orderIndex,
    required super.description,
    required this.imageLink,
  });
  final String imageLink;

  @override
  ImageProvider<Object> get imageProvider => ExtendedNetworkImageProvider(imageLink);
}
