// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';

part 'remote_push_notification_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class RemotePushNotificationPayload extends PushNotificationPayload {
  final int? orderId;
  final NotificationType notiType;

  RemotePushNotificationPayload({
    required this.orderId,
    required this.notiType,
  });

  factory RemotePushNotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$RemotePushNotificationPayloadFromJson(json);
  factory RemotePushNotificationPayload.fromJsonString(String json) {
    return RemotePushNotificationPayload.fromJson(jsonDecode(json));
  }
  @override
  Map<String, dynamic> toJson() => _$RemotePushNotificationPayloadToJson(this);
}
