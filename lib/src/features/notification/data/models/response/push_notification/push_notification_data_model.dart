// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_notification_data_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class PushNotificationDataModel {
  final PushNotificationDataOrderModel? order;

  PushNotificationDataModel(
    this.order,
  );

  factory PushNotificationDataModel.fromJson(Map<String, dynamic> json) => _$PushNotificationDataModelFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class PushNotificationDataOrderModel {
  final int id;
  final List<ShortOrderDetailResponseModel> orderDetails;
  PushNotificationDataOrderModel({
    required this.id,
    required this.orderDetails,
  });

  factory PushNotificationDataOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationDataOrderModelFromJson(json);
}
