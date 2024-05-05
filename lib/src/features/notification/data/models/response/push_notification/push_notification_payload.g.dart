// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationPayload _$PushNotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    PushNotificationPayload(
      orderId: json['orderId'] as int?,
      notiType: $enumDecode(_$NotificationTypeEnumMap, json['notiType']),
    );

Map<String, dynamic> _$PushNotificationPayloadToJson(
        PushNotificationPayload instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'notiType': _$NotificationTypeEnumMap[instance.notiType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.userOrderNoti: 1,
  NotificationType.shopOrderNoti: 2,
  NotificationType.ads: 4,
};
