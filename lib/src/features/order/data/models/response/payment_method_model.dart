// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'payment_method_model.g.dart';

@JsonSerializable(createToJson: false)
class PaymentMethodModel {
  final int id;
  final String name;

  PaymentMethodModel(
    this.id,
    this.name,
  );

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodModelFromJson(json);
}
