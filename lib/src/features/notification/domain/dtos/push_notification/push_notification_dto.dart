// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';

// part 'push_notification_model.g.dart';

abstract class PushNotificationDto<Payload extends PushNotificationPayload> extends Equatable {
  const PushNotificationDto({
    required this.title,
    required this.description,
    required this.createdDate,
  });

  final String title;
  final String description;
  final DateTime createdDate;

  Payload get payload;
  String get subtitle;
  String get displayTitle;

  @override
  List<Object?> get props => [
        title,
        description,
        createdDate,
      ];
}
