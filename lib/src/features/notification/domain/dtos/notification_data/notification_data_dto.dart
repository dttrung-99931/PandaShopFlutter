// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/notification/data/models/response/notification_data_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_data/short_order_dto.dart';

class NotificationDataDto {
  NotificationDataDto({
    required this.order,
  });
  final ShortOrderDto? order;

  factory NotificationDataDto.fromModel(NotificationDataModel model) {
    return NotificationDataDto(
      order: model.order != null ? ShortOrderDto.fromModel(model.order!) : null,
    );
  }
}
