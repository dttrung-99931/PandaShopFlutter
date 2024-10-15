// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';

part 'notification_data_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class NotificationDataModel {
  final ShortOrderModel? order;

  NotificationDataModel(
    this.order,
  );

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class ShortOrderModel {
  final OrderStatus status;
  // final List<ShortDeliveryResponseModel> deliveries;
  final List<ShortOrderDetailResponseModel> orderDetails;

  ShortOrderModel(
    this.status,
    // this.deliveries,
    this.orderDetails,
  );

  factory ShortOrderModel.fromJson(Map<String, dynamic> json) => _$ShortOrderModelFromJson(json);
}
