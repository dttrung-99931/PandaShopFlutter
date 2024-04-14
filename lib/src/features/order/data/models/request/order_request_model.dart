// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/order/data/models/request/sub_order_request_model.dart';

part 'order_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class OrderRequestModel {
  final int? id;
  final int userId;
  final int paymentMethodId;
  final String? note;
  final List<SubOrderRequestModel> subOrders;
  OrderRequestModel({
    required this.id,
    required this.userId,
    required this.paymentMethodId,
    required this.note,
    required this.subOrders,
  });

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}
