// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationModel _$PushNotificationModelFromJson(Map<String, dynamic> json) => PushNotificationModel(
      json['title'] as String,
      json['description'] as String,
      $enumDecode(_$NotificationTypeEnumMap, json['type']),
      PushNotificationDataModel.fromJson(json['data'] as Map<String, dynamic>),
      DateTime.parse(json['createdDate'] as String),
    );

const _$NotificationTypeEnumMap = {
  NotificationType.userOrderNoti: 1,
  NotificationType.shopOrderNoti: 2,
  NotificationType.ads: 4,
};

const _$UserNotificationStatusEnumMap = {
  UserNotificationStatus.sent: 1,
  UserNotificationStatus.seen: 4,
  UserNotificationStatus.sentFailed: 8,
};

PushNotificationDataModel _$PushNotificationDataModelFromJson(Map<String, dynamic> json) => PushNotificationDataModel(
      json['orderId'] as int?,
    );
