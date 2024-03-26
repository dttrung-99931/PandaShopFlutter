import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';

class PropertyTemplateDto {
  final int id;
  final List<PropertyValuesDto> properties;
  PropertyTemplateDto({
    required this.id,
    required this.properties,
  });

  factory PropertyTemplateDto.fromModel(PropertyTemplateModel model) {
    return PropertyTemplateDto(
      id: model.id,
      properties: model.properties.mapList((element) => PropertyValuesDto.fromModel(element)),
    );
  }
}
