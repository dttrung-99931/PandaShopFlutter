// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_notification_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class PushNotificationModel {
  final String title;
  final String description;
  final NotificationType type;
  final PushNotificationDataModel data;
  final DateTime createdDate;

  PushNotificationModel(
    this.title,
    this.description,
    this.type,
    this.data,
    this.createdDate,
  );

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) => _$PushNotificationModelFromJson(json);
}
