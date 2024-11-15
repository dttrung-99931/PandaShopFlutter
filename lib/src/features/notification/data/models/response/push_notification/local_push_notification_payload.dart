// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_push_notification_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalPushNotificationPayload extends PushNotificationPayload {
  LocalPushNotificationPayload();

  factory LocalPushNotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$LocalPushNotificationPayloadFromJson(json);
  factory LocalPushNotificationPayload.fromJsonString(String json) {
    return LocalPushNotificationPayload.fromJson(jsonDecode(json));
  }
  @override
  Map<String, dynamic> toJson() => _$LocalPushNotificationPayloadToJson(this);
}
