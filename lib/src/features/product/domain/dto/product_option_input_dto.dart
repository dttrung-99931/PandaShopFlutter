import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:flutter/widgets.dart';

class ProductOptionInputDto {
  final int id;
  final TextEditingController nameTextController = TextEditingController();
  // Map<propId, text controller>
  final Map<int, TextEditingController> propTextControllerMap;
  final TextEditingController priceController = TextEditingController();

  ProductOptionInputDto({
    required this.id,
    required this.propTextControllerMap,
  });

  factory ProductOptionInputDto.fromProps(List<PropertyValuesDto> props) {
    return ProductOptionInputDto(
      id: Constatnts.idEmpty,
      propTextControllerMap: Map.fromEntries(props.mapList(
        (element) => MapEntry(element.id, TextEditingController()),
      )),
    );
  }
}
