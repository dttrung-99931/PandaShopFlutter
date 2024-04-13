// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/delivery_method_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class DeliveryMethodDto extends Equatable {
  final int id;
  final String name;

  const DeliveryMethodDto({
    required this.id,
    required this.name,
  });

  factory DeliveryMethodDto.fromModel(DeliveryMethodModel model) {
    return DeliveryMethodDto(name: model.name, id: model.id);
  }

  @override
  List<Object?> get props => [id];
}
