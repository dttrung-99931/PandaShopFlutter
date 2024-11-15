// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/push_notification/remote_push_notification_payload.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_data_dto.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/push_notification/push_notification_dto.dart';

import '../../../data/models/response/push_notification/push_notification_model.dart';

// part 'push_notification_model.g.dart';

class RemotePushNotificationDto extends PushNotificationDto<RemotePushNotificationPayload> {
  final PushNotificationDataDto data;
  final NotificationType type;

  const RemotePushNotificationDto({
    required this.data,
    required super.title,
    required super.description,
    required this.type,
    required super.createdDate,
  });

  factory RemotePushNotificationDto.fromModel(PushNotificationModel model) {
    return RemotePushNotificationDto(
      title: model.title,
      description: model.description,
      type: model.type,
      data: PushNotificationDataDto.fromModel(model.data),
      createdDate: model.createdDate,
    );
  }

  @override
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

  @override
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

  @override
  List<Object?> get props => [createdDate];

  @override
  RemotePushNotificationPayload get payload => RemotePushNotificationPayload(orderId: data.order?.id, notiType: type);
}
