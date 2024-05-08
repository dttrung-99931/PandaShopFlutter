// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';

part 'push_notification_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class PushNotificationPayload {
  final int? orderId;
  final NotificationType notiType;

  PushNotificationPayload({
    required this.orderId,
    required this.notiType,
  });

  factory PushNotificationPayload.fromJson(Map<String, dynamic> json) => _$PushNotificationPayloadFromJson(json);
  factory PushNotificationPayload.fromJsonString(String json) {
    return PushNotificationPayload.fromJson(jsonDecode(json));
  }
  Map<String, dynamic> toJson() => _$PushNotificationPayloadToJson(this);
}
