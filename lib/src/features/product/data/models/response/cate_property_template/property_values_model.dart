import 'package:json_annotation/json_annotation.dart';

part 'property_values_model.g.dart';

@JsonSerializable(createToJson: false)
class PropertyValuesModel {
  final String propertyName;
  final bool isRequired;
  final int id;
  @JsonKey(name: 'values')
  final List<String> exampleValues;
  final int propertyId;
  PropertyValuesModel({
    required this.propertyName,
    required this.isRequired,
    required this.id,
    required this.exampleValues,
    required this.propertyId,
  });

  factory PropertyValuesModel.fromJson(Map<String, dynamic> json) => _$PropertyValuesModelFromJson(json);
}
