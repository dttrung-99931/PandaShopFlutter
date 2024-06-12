// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class DeliveryDto {
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final DeliveryStatus status;
  final DeliveryMethodDto deliveryMethod;

  DeliveryDto({
    required this.startedAt,
    required this.finishedAt,
    required this.status,
    required this.deliveryMethod,
  });

  factory DeliveryDto.fromModel(DeliveryResponseModel model) {
    return DeliveryDto(
      startedAt: model.startedAt,
      finishedAt: model.finishedAt,
      status: model.status,
      deliveryMethod: DeliveryMethodDto.fromModel(model.deliveryMethod),
    );
  }
}
