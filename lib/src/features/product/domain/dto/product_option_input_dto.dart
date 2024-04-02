import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/parse_utils.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_value_dto.dart';
import 'package:flutter/widgets.dart';

class ProductOptionInputDto extends Equatable {
  static int _mockIdGen = -1;
  static int _genMockId() {
    return _mockIdGen--;
  }

  final int id;
  final TextEditingController nameTextController = TextEditingController();
  // Map<propId, text controller>
  final Map<PropertyValuesDto, TextEditingController> propTextControllerMap;
  final TextEditingController priceController = TextEditingController();

  ProductOptionInputDto({
    required this.id,
    required this.propTextControllerMap,
  });

  factory ProductOptionInputDto.fromProps(List<PropertyValuesDto> props) {
    return ProductOptionInputDto(
      id: _genMockId(),
      propTextControllerMap: Map.fromEntries(props.mapList(
        (element) => MapEntry(element, TextEditingController()),
      )),
    );
  }

  ProductOptionRequestModel toRequestModel() {
    return ProductOptionRequestModel(
      name: nameTextController.text,
      price: parseDouble(priceController.text),
      properties: propTextControllerMap.entries.mapList(
        (MapEntry<PropertyValuesDto, TextEditingController> element) => PropertyValueRequestModel(
          propertyId: element.key.propertyId,
          value: element.value.text,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [id];
}
