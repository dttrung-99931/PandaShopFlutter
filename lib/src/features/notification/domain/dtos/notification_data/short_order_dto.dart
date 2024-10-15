// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_data_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';

class ShortOrderDto {
  ShortOrderDto({
    required this.status,
    // required this.deliveries,
    required this.orderDetails,
  });
  final OrderStatus status;
  // final List<ShortDeliveryDto> deliveries;
  final List<ShortOrderDetailDto> orderDetails;

  String get productAndOptionNames {
    return orderDetails
        .map((ShortOrderDetailDto detail) => '${detail.productName} ${detail.productOptionName}')
        .join('\n');
  }

  factory ShortOrderDto.fromModel(ShortOrderModel model) {
    return ShortOrderDto(
      status: model.status,
      // deliveries: model.deliveries.mapList((delivery) => ShortDeliveryDto.fromModel(delivery)),
      orderDetails: model.orderDetails.mapList((element) => ShortOrderDetailDto.fromModel(element)),
    );
  }
}

class ShortDeliveryDto {
  final DateTime? finishedAt;
  final DeliveryStatus status;

  ShortDeliveryDto({
    required this.finishedAt,
    required this.status,
  });

  factory ShortDeliveryDto.fromModel(ShortDeliveryResponseModel model) {
    return ShortDeliveryDto(
      status: model.status,
      finishedAt: model.finishedAt,
    );
  }
}

class ShortOrderDetailDto {
  final String productOptionName;
  final String productName;

  ShortOrderDetailDto({
    required this.productOptionName,
    required this.productName,
  });

  factory ShortOrderDetailDto.fromModel(ShortOrderDetailResponseModel model) {
    return ShortOrderDetailDto(
      productOptionName: model.productOptionName,
      productName: model.productName,
    );
  }
}
