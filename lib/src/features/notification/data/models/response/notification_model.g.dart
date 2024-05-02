// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      json['title'] as String,
      json['description'] as String,
      $enumDecode(_$NotificationTypeEnumMap, json['type']),
      NotificationDataModel.fromJson(json['data'] as Map<String, dynamic>),
      DateTime.parse(json['createdDate'] as String),
      $enumDecode(_$UserNotificationStatusEnumMap, json['status']),
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
