// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
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
  final DeliveryDto delivery;
  final List<OrderDetailDto> orderDetails;

  OrderDto({
    required this.id,
    required this.note,
    required this.user,
    required this.status,
    required this.delivery,
    required this.orderDetails,
  });

  factory OrderDto.fromModel(OrderResponseModel model) {
    return OrderDto(
      id: model.id,
      delivery: DeliveryDto.fromModel(model.delivery),
      note: model.note,
      orderDetails: model.orderDetails.mapList((element) => OrderDetailDto.fromModel(element)),
      status: OrderStatus.created, // TODO
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