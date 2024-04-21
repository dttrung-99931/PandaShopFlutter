// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/sub_order_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/user_short_dto.dart';

class OrderDto {
  final int id;
  final String? note;
  final List<SubOrderDto> subOrders;
  final PaymentMethodModel paymentMethod;
  final UserShortDto user;
  final OrderStatus status;

  OrderDto({
    required this.id,
    required this.note,
    required this.subOrders,
    required this.paymentMethod,
    required this.user,
    required this.status,
  });

  factory OrderDto.fromModel(OrderResponseModel model) {
    return OrderDto(
      id: model.id,
      note: model.note,
      subOrders: model.subOrders.mapList((element) => SubOrderDto.fromModel(element)),
      paymentMethod: model.paymentMethod,
      user: UserShortDto.fromModel(model.user),
      status: model.status,
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
