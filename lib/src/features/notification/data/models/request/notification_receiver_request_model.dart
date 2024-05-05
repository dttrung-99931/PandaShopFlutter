// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'notification_receiver_request_model.g.dart';

@JsonSerializable(createFactory: false)
class NotificationReceiverRequestModel {
  NotificationReceiverRequestModel({
    required this.token,
    required this.senderType,
  });
  final String token;
  final NotificationSenderType senderType;

  Map<String, dynamic> toJson() => _$NotificationReceiverRequestModelToJson(this);
}

enum NotificationSenderType {
  @JsonValue(4)
  fcm,
}
