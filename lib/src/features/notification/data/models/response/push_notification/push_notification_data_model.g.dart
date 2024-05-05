// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationDataModel _$PushNotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    PushNotificationDataModel(
      json['order'] == null
          ? null
          : PushNotificationDataOrderModel.fromJson(
              json['order'] as Map<String, dynamic>),
    );

PushNotificationDataOrderModel _$PushNotificationDataOrderModelFromJson(
        Map<String, dynamic> json) =>
    PushNotificationDataOrderModel(
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) =>
              ShortOrderDetailResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
