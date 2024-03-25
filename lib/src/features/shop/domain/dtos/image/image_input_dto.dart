import 'package:evievm_app/core/utils/encode_utils.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/src/painting/image_provider.dart';

class ImageInputDto extends BaseImageDto {
  final int? id;
  final String based64Img;
  final int orderIndex;
  final String description;

  ImageInputDto({
    required this.id,
    required this.based64Img,
    required this.orderIndex,
    required this.description,
  });

  @override
  ImageProvider<Object> get imageProvider => ExtendedMemoryImageProvider(
        decodeBase64(based64Img)!,
      );
}
