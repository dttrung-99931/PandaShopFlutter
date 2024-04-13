// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class PaymentMethodDto extends Equatable {
  final int id;
  final String name;

  const PaymentMethodDto({
    required this.id,
    required this.name,
  });

  factory PaymentMethodDto.fromModel(PaymentMethodModel model) {
    return PaymentMethodDto(name: model.name, id: model.id);
  }

  @override
  List<Object?> get props => [id];
}
