// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';

import '../../data/models/response/push_notification_model.dart';

// part 'push_notification_model.g.dart';

class PushNotificationDto extends Equatable {
  final String title;
  final String description;
  final NotificationType type;
  final PushNotificationDataDto data;
  final DateTime createdDate;

  const PushNotificationDto({
    required this.title,
    required this.description,
    required this.type,
    required this.data,
    required this.createdDate,
  });

  factory PushNotificationDto.fromModel(PushNotificationModel model) {
    return PushNotificationDto(
      title: model.title,
      description: model.description,
      type: model.type,
      data: PushNotificationDataDto.fromModel(model.data),
      createdDate: model.createdDate,
    );
  }

  @override
  List<Object?> get props => [createdDate];
}

class PushNotificationDataDto {
  final int? orderId;

  PushNotificationDataDto({
    required this.orderId,
  });

  factory PushNotificationDataDto.fromModel(PushNotificationDataModel model) {
    return PushNotificationDataDto(orderId: model.orderId);
  }
}
