// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';

class NotificationDto {
  NotificationDto({
    required this.title,
    required this.description,
    required this.type,
  });
  final String title;
  final String description;
  final NotificationType type;
  // TODO: declare more dto fields

  factory NotificationDto.fromModel(NotificationModel model) {
    return NotificationDto(
      title: model.title,
      description: model.description,
      type: model.type,
    );
  }
}
