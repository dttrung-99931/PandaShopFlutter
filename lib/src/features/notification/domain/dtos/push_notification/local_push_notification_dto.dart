import 'package:evievm_app/src/features/notification/data/models/response/push_notification/local_push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';

class LocalPushNotificationDto extends PushNotificationDto<LocalPushNotificationPayload> {
  LocalPushNotificationDto({
    required super.title,
    required super.description,
  }) : super(createdDate: DateTime.now());

  @override
  String get displayTitle => title;

  @override
  String get subtitle => description;

  @override
  LocalPushNotificationPayload get payload => LocalPushNotificationPayload();
}
