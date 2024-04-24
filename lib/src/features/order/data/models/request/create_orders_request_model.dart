// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';

part 'create_orders_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class CreateOrdersRequestModel {
  final int paymentMethodId;
  final String? note;
  final List<OrderRequestModel> orders;
  CreateOrdersRequestModel({
    required this.paymentMethodId,
    required this.note,
    required this.orders,
  });

  Map<String, dynamic> toJson() => _$CreateOrdersRequestModelToJson(this);
}
