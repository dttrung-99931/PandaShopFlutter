// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_location_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_progress_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';

class DeliveryWithOrdersResponseDto {
  DeliveryWithOrdersResponseDto({
    required this.id,
    required this.status,
    this.progress,
    required this.orders,
    required this.deliveryPartnerUnitAddress,
    required this.locations,
  });
  final int id;
  final DeliveryStatus status;
  final DeliveryProgressDto? progress;
  final List<OrderDto> orders;
  final AddressDto deliveryPartnerUnitAddress;
  final List<DeliveryLocationDto> locations;

  // TODO: handle determining dest location, there may be multiple dest locations one by one
  DeliveryLocationDto get currentDestLocation => locations.first;

  factory DeliveryWithOrdersResponseDto.fromModel(DeliveryWithOrdersResponseModel model) {
    return DeliveryWithOrdersResponseDto(
        id: model.id,
        orders: model.orders.mapList((orderModel) => OrderDto.fromModel(orderModel)),
        deliveryPartnerUnitAddress: AddressDto.fromModel(model.deliveryPartnerUnitAddress),
        status: model.status,
        progress: model.progress != null ? DeliveryProgressDto.fromModel(model.progress!) : null,
        locations: model.deliveryLocations.mapList(
          (location) => DeliveryLocationDto.fromModel(location),
        ));
  }

  DeliveryWithOrdersResponseDto copyWith({
    int? id,
    DeliveryStatus? status,
    DeliveryProgressDto? progress,
    List<OrderDto>? orders,
    AddressDto? deliveryPartnerUnitAddress,
    List<DeliveryLocationDto>? locations,
  }) {
    return DeliveryWithOrdersResponseDto(
      id: id ?? this.id,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      orders: orders ?? this.orders,
      deliveryPartnerUnitAddress: deliveryPartnerUnitAddress ?? this.deliveryPartnerUnitAddress,
      locations: locations ?? this.locations,
    );
  }
}
