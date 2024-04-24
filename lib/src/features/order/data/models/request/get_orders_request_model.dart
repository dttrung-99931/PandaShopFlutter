// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';

part 'get_orders_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class GetOrdersRequestModel {
  final int? userId;
  final int? shopId;
  final OrderStatus? status;
  GetOrdersRequestModel({
    this.userId,
    this.shopId,
    this.status,
  });

  Map<String, dynamic> toJson() => _$GetOrdersRequestModelToJson(this);
}
