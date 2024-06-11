// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/delivery_method_model.dart';

part 'delivery_response_model.g.dart';

@JsonSerializable(createToJson: false)
class DeliveryResponseModel {
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final DeliveryStatus status;
  final DeliveryMethodModel deliveryMethod;
  final AddressModel customerAddress;

  DeliveryResponseModel({
    this.startedAt,
    this.finishedAt,
    required this.status,
    required this.deliveryMethod,
    required this.customerAddress,
  });

  factory DeliveryResponseModel.fromJson(Map<String, dynamic> json) => _$DeliveryResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ShortDeliveryResponseModel {
  final DateTime? finishedAt;
  final DeliveryStatus status;

  ShortDeliveryResponseModel({
    this.finishedAt,
    required this.status,
  });

  factory ShortDeliveryResponseModel.fromJson(Map<String, dynamic> json) => _$ShortDeliveryResponseModelFromJson(json);
}

enum DeliveryStatus {
  @JsonValue(1)
  created, // when an order.status = Created
  @JsonValue(4)
  findingDriver,
  @JsonValue(6)
  foundDriver, // When a driver found & driver confirm
  @JsonValue(8)
  movingToShop,
  @JsonValue(12)
  receivingProduct, // Driver come to the shop and waiting for receiving the product
  @JsonValue(16)
  delivering, // Driver has been rececived the product and moving to delivery
  @JsonValue(20)
  delivered, // Driver delivered to buyer
  @JsonValue(24)
  cancelled, //
  @JsonValue(28)
  lose, // Lose the product
  @JsonValue(32)
  productBroken,
}
