// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/notification/data/models/response/notification_overview_model.dart';

class NotificationOverviewDto {
  NotificationOverviewDto({
    required this.newNotiNum,
    required this.total,
  });

  final int newNotiNum;
  final int total;

  factory NotificationOverviewDto.fromModel(NotificationOverviewModel model) {
    return NotificationOverviewDto(
      newNotiNum: model.newNotiNum,
      total: model.total,
    );
  }
}
