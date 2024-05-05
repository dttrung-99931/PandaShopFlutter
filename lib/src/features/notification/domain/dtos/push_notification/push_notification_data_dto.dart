// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_data/short_order_dto.dart';

import '../../../data/models/response/push_notification/push_notification_data_model.dart';

// part 'push_notification_model.g.dart';

class PushNotificationDataDto {
  final PushNotificationDataOrderDto? order;

  PushNotificationDataDto({
    required this.order,
  });

  factory PushNotificationDataDto.fromModel(PushNotificationDataModel model) {
    return PushNotificationDataDto(
        order: model.order != null
            ? PushNotificationDataOrderDto.fromModel(
                model.order!,
              )
            : null);
  }
}

class PushNotificationDataOrderDto {
  final List<ShortOrderDetailDto> orderDetails;
  PushNotificationDataOrderDto({
    required this.orderDetails,
  });

  factory PushNotificationDataOrderDto.fromModel(PushNotificationDataOrderModel model) {
    return PushNotificationDataOrderDto(
        orderDetails: model.orderDetails.mapList(
      (element) => ShortOrderDetailDto.fromModel(element),
    ));
  }
}
