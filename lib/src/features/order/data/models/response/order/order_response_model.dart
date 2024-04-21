// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/order/data/models/response/order/sub_order_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/user_short_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/payment_method_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class OrderResponseModel {
  final int id;
  final String? note;
  final List<SubOrderResponseModel> subOrders;
  final PaymentMethodModel paymentMethod;
  final UserShortResponseModel user;
  final OrderStatus status;
  OrderResponseModel({
    required this.id,
    required this.note,
    required this.subOrders,
    required this.paymentMethod,
    required this.user,
    required this.status,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) => _$OrderResponseModelFromJson(json);
}

enum OrderStatus {
  @JsonValue(1)
  created, // Successful created order. Paid paid or pay latter
  @JsonValue(4)
  pending, // when order with pay now method and pending for payemnt completed
  @JsonValue(12)
  processing, // When shop comfirmed order and processing
  @JsonValue(16)
  cancelledByBuyer,
  @JsonValue(20)
  cancelledByShop,
  @JsonValue(24)
  waitingForDelivering, // Processes and waiting for delivering
  @JsonValue(28)
  delivering, // Delivering
  @JsonValue(32)
  delivered, // Deliveried, buyer received the product
  @JsonValue(36)
  completedByUser, // User comfirm completed order
  @JsonValue(40)
  completedBySystem, // order completed after a duration from Deliveried date
  @JsonValue(44)
  lost, // Order is loosed, Thất lạc
}
