// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_location_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_detail_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/user_short_dto.dart';

class OrderDto {
  final int id;
  final String? note;
  // final PaymentMethodModel paymentMethod;
  final UserShortDto user;
  final OrderStatus status;
  final List<DeliveryDto> deliveries;
  final List<OrderDetailDto> orderDetails;

  AddressDto get deliveryPartnerAddress {
    AddressDto? address = deliveries
        .map((delivery) => delivery.deliveryLocations)
        .merge()
        .firstWhereOrNull((location) => location.locationType == DeliveryLocationType.deliveryPartner)
        ?.address;
    return address ?? (throw 'Order has no delivery to delivery partner due to it has been not completed processing');
  }

  AddressDto get customerAddress {
    AddressDto address = deliveries
        .map((delivery) => delivery.deliveryLocations)
        .merge()
        .firstWhere((location) => location.locationType == DeliveryLocationType.delivery)
        .address;
    return address;
  }

  OrderDto({
    required this.id,
    required this.note,
    required this.user,
    required this.status,
    required this.deliveries,
    required this.orderDetails,
  });

  factory OrderDto.fromModel(OrderResponseModel model) {
    return OrderDto(
      id: model.id,
      deliveries: model.deliveries.mapList((element) => DeliveryDto.fromModel(element)),
      note: model.note,
      orderDetails: model.orderDetails.mapList((element) => OrderDetailDto.fromModel(element)),
      status: model.status,
      user: UserShortDto.fromModel(model.user),
    );
  }
}

extension OrderStatusExt on OrderStatus {
  String get title {
    switch (this) {
      case OrderStatus.pending:
        return 'Chờ thanh toán';
      case OrderStatus.created:
        return 'Đơn mới';
      case OrderStatus.processing:
        return 'Đang xử lý';
      case OrderStatus.cancelledByBuyer:
        return 'Người dùng huỷ';
      case OrderStatus.cancelledByShop:
        return 'Shop huỷ';
      case OrderStatus.waitingForDelivering:
        return 'Chờ vận chuyển';
      case OrderStatus.delivering:
        return 'Đang vận chuyển';
      case OrderStatus.delivered:
        return 'Giao hàng thành công';
      case OrderStatus.completedByUser:
        return 'Hoàn thành';
      case OrderStatus.completedBySystem:
        return 'Hoàn thành (tự động)';
      case OrderStatus.lost:
        return 'Thất lạc';
    }
  }
}
