import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_values_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property_template_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class PropertyTemplateModel {
  final int id;
  final List<PropertyValuesModel> properties;
  PropertyTemplateModel({
    required this.id,
    required this.properties,
  });

  factory PropertyTemplateModel.fromJson(Map<String, dynamic> json) => _$PropertyTemplateModelFromJson(json);
}
