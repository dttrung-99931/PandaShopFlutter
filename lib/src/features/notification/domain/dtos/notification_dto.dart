// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_data/notification_data_dto.dart';

class NotificationDto {
  NotificationDto({
    required this.title,
    required this.description,
    required this.type,
    required this.data,
    required this.createdDate,
  });
  final String title;
  final String description;
  final NotificationType type;
  final NotificationDataDto data;
  final DateTime createdDate;

  factory NotificationDto.fromModel(NotificationModel model) {
    return NotificationDto(
      title: model.title,
      description: model.description,
      type: model.type,
      data: NotificationDataDto.fromModel(model.data),
      createdDate: model.createdDate,
    );
  }
}
