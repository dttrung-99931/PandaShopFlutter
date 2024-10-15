// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_location_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';

class DeliveryDto {
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final DeliveryStatus status;
  final DeliveryMethodDto deliveryMethod;
  final List<DeliveryLocationDto> deliveryLocations;

  DeliveryDto({
    required this.startedAt,
    required this.finishedAt,
    required this.status,
    required this.deliveryMethod,
    required this.deliveryLocations,
  });

  factory DeliveryDto.fromModel(DeliveryResponseModel model) {
    return DeliveryDto(
      startedAt: model.startedAt,
      finishedAt: model.finishedAt,
      status: model.status,
      deliveryMethod: DeliveryMethodDto.fromModel(model.deliveryMethod),
      deliveryLocations: model.deliveryLocations.mapList(
        (location) => DeliveryLocationDto.fromModel(location),
      ),
    );
  }
}
