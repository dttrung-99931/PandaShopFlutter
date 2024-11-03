// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/user_short_response_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_detail_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class OrderResponseModel {
  final int id;
  final String? note;
  // final PaymentMethodModel paymentMethod;
  final UserShortResponseModel user;
  final OrderStatus status;
  final List<OrderDetailResponseModel> orderDetails;
  // TODO: change to DeliveryResponseModel customerDelivery {address, deliveryMethod}
  @JsonKey(name: 'deliveryAddress')
  final AddressModel customerAddress;
  // final List<OrderDetailResponseModel> orderDetails;

  OrderResponseModel({
    required this.id,
    this.note,
    required this.user,
    required this.status,
    required this.orderDetails,
    required this.customerAddress,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) => _$OrderResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class OrderDetailResponseModel {
  final int id;
  final DateTime? createdAt;
  final double discountPercent;
  final double price;
  final int productNum;
  final ProductOptionModel productOption;
  final ShortProductModel product;

  OrderDetailResponseModel({
    required this.id,
    this.createdAt,
    required this.discountPercent,
    required this.price,
    required this.productNum,
    required this.productOption,
    required this.product,
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class ShortOrderDetailResponseModel {
  final String productOptionName;
  final String productName;

  ShortOrderDetailResponseModel({
    required this.productOptionName,
    required this.productName,
  });

  factory ShortOrderDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShortOrderDetailResponseModelFromJson(json);
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
  @JsonValue(22)
  completeProcessing, // Complete processes and waiting for request delivering
  @JsonValue(24)
  waitingForDelivering, // Waiting for delivering
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
