import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';

class HomeBannerDto extends ImageDto {
  HomeBannerDto({required super.link, required super.description});

  factory HomeBannerDto.fromModel(HomeBannerModel model) {
    return HomeBannerDto(link: model.imageLink, description: '');
  }
}
