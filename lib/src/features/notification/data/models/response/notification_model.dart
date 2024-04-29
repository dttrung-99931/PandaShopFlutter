// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/notification/data/models/response/notification_data_model.dart';

part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class NotificationModel {
  final String title;
  final String description;
  final NotificationType type;
  final NotificationDataModel data;

  NotificationModel(
    this.title,
    this.description,
    this.type,
    this.data,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

enum NotificationType {
  @JsonValue(1)
  order,
  @JsonValue(4)
  ads, // ...
}
