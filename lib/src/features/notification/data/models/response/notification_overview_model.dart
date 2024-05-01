// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'notification_overview_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class NotificationOverviewModel {
  final int newNotiNum;
  final int total;

  NotificationOverviewModel(
    this.newNotiNum,
    this.total,
  );

  factory NotificationOverviewModel.fromJson(Map<String, dynamic> json) => _$NotificationOverviewModelFromJson(json);
}
