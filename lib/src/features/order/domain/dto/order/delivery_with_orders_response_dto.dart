// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_progress_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';

class DeliveryWithOrdersResponseDto {
  final int id;
  final DeliveryStatus status;
  final DeliveryProgressDto? progress;
  final List<OrderDto> orders;
  final AddressDto deliveryPartnerUnitAddress;

  DeliveryWithOrdersResponseDto({
    required this.id,
    required this.status,
    this.progress,
    required this.orders,
    required this.deliveryPartnerUnitAddress,
  });

  factory DeliveryWithOrdersResponseDto.fromModel(DeliveryWithOrdersResponseModel model) {
    return DeliveryWithOrdersResponseDto(
      id: model.id,
      orders: model.orders.mapList((orderModel) => OrderDto.fromModel(orderModel)),
      deliveryPartnerUnitAddress: AddressDto.fromModel(model.deliveryPartnerUnitAddress),
      status: model.status,
      progress: model.progress != null ? DeliveryProgressDto.fromModel(model.progress!) : null,
    );
  }
}
