// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_data_dto.dart';

import '../../../data/models/response/push_notification/push_notification_model.dart';

// part 'push_notification_model.g.dart';

class PushNotificationDto extends Equatable {
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

  final String title;
  final String description;
  final NotificationType type;
  final PushNotificationDataDto data;
  final DateTime createdDate;

  String get subtitle {
    switch (type) {
      case NotificationType.userOrderNoti:
      case NotificationType.shopOrderNoti:
        return data.order!.orderDetails
            .mapList((element) => '${element.productName} ${element.productOptionName}')
            .join('\n');
      case NotificationType.ads:
        return '';
    }
  }

  String get displayTitle {
    switch (type) {
      case NotificationType.userOrderNoti:
      case NotificationType.shopOrderNoti:
        // Only enough for subtitle (product name) on push noti
        return subtitle;

      case NotificationType.ads:
        return '$title\n$subtitle';
    }
  }

  PushNotificationPayload getPayload() {
    return PushNotificationPayload(orderId: data.order?.id, notiType: type);
  }

  @override
  List<Object?> get props => [createdDate];
}
