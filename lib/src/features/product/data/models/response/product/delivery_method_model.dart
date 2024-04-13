// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'delivery_method_model.g.dart';

@JsonSerializable(createToJson: false)
class DeliveryMethodModel {
  final int id;
  final String name;

  DeliveryMethodModel(
    this.id,
    this.name,
  );

  factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) => _$DeliveryMethodModelFromJson(json);
}
