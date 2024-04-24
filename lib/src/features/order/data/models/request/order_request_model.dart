// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'order_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class OrderRequestModel {
  final int? id;
  final int addressId;
  final int deliveryMethodId;
  final List<OrderDetailRequestModel> orderDetails;
  OrderRequestModel({
    required this.id,
    required this.addressId,
    required this.deliveryMethodId,
    required this.orderDetails,
  });

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false, createFactory: false)
class OrderDetailRequestModel {
  final int? id;
  final int productOptionId;
  final int productNum;
  OrderDetailRequestModel({
    required this.id,
    required this.productOptionId,
    required this.productNum,
  });

  Map<String, dynamic> toJson() => _$OrderDetailRequestModelToJson(this);
}
