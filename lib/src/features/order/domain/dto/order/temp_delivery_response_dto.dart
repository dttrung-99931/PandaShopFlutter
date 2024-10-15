// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/temp_delivery_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';

class TempDeliveryResponseDto {
  final List<OrderDto> orders;
  final AddressDto deliveryPartnerUnitAddress;
  final int deliveryPartnerUnitId;
  final int deliveryMethodId;

  TempDeliveryResponseDto({
    required this.orders,
    required this.deliveryPartnerUnitAddress,
    required this.deliveryPartnerUnitId,
    required this.deliveryMethodId,
  });

  factory TempDeliveryResponseDto.fromModel(TempDeliveryResponseModel model) {
    return TempDeliveryResponseDto(
      orders: model.orders.mapList((orderModel) => OrderDto.fromModel(orderModel)),
      deliveryPartnerUnitAddress: AddressDto.fromModel(model.deliveryPartnerUnitAddress),
      deliveryPartnerUnitId: model.deliveryPartnerUnitId,
      deliveryMethodId: model.deliveryMethodId,
    );
  }

  RequestPartnerDeliveryRequestModel toRequestPartnerDeliveryModel() {
    return RequestPartnerDeliveryRequestModel(
      deliveryMethodId: deliveryMethodId,
      deliveryPartnerUnitAddressId: deliveryPartnerUnitAddress.id,
      deliveryPartnerUnitId: deliveryPartnerUnitId,
      orderIds: orders.mapList((order) => order.id),
    );
  }
}
