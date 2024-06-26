// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_values_model.dart';

class PropertyValuesDto extends Equatable {
  final String propertyName;
  final bool isRequired;
  final int id;
  final List<String> exampleValues;
  final int propertyId;

  const PropertyValuesDto({
    required this.propertyName,
    required this.isRequired,
    required this.id,
    required this.exampleValues,
    required this.propertyId,
  });

  factory PropertyValuesDto.fromModel(PropertyValuesModel model) {
    return PropertyValuesDto(
      propertyName: model.propertyName,
      isRequired: model.isRequired,
      id: model.id,
      exampleValues: model.exampleValues,
      propertyId: model.propertyId,
    );
  }

  @override
  List<Object?> get props => [id];
}
