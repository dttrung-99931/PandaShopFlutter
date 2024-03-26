import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';

class HomeBannerDto extends ImageDto {
  HomeBannerDto({required super.link, required super.description, required super.id});

  factory HomeBannerDto.fromModel(HomeBannerModel model) {
    return HomeBannerDto(link: model.imageLink, description: '', id: Constatnts.idEmpty);
  }
}
