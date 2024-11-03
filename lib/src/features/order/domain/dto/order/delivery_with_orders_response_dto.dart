// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';

class DeliveryWithOrdersResponseDto {
  final int id;
  final List<OrderDto> orders;
  final AddressDto deliveryPartnerUnitAddress;

  DeliveryWithOrdersResponseDto({
    required this.id,
    required this.orders,
    required this.deliveryPartnerUnitAddress,
  });

  factory DeliveryWithOrdersResponseDto.fromModel(DeliveryWithOrdersResponseModel model) {
    return DeliveryWithOrdersResponseDto(
      id: model.id,
      orders: model.orders.mapList((orderModel) => OrderDto.fromModel(orderModel)),
      deliveryPartnerUnitAddress: AddressDto.fromModel(model.deliveryPartnerUnitAddress),
    );
  }
}
