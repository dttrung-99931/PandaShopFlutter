// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_push_notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePushNotificationPayload _$RemotePushNotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    RemotePushNotificationPayload(
      orderId: (json['orderId'] as num?)?.toInt(),
      notiType: $enumDecode(_$NotificationTypeEnumMap, json['notiType']),
    );

Map<String, dynamic> _$RemotePushNotificationPayloadToJson(
        RemotePushNotificationPayload instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'notiType': _$NotificationTypeEnumMap[instance.notiType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.userOrderNoti: 1,
  NotificationType.shopOrderNoti: 2,
  NotificationType.ads: 4,
};
