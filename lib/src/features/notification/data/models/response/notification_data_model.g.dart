// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDataModel _$NotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    NotificationDataModel(
      json['order'] == null
          ? null
          : ShortOrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );

ShortOrderModel _$ShortOrderModelFromJson(Map<String, dynamic> json) =>
    ShortOrderModel(
      $enumDecode(_$OrderStatusEnumMap, json['status']),
      ShortDeliveryResponseModel.fromJson(
          json['delivery'] as Map<String, dynamic>),
      (json['orderDetails'] as List<dynamic>)
          .map((e) =>
              ShortOrderDetailResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$OrderStatusEnumMap = {
  OrderStatus.created: 1,
  OrderStatus.pending: 4,
  OrderStatus.processing: 12,
  OrderStatus.cancelledByBuyer: 16,
  OrderStatus.cancelledByShop: 20,
  OrderStatus.waitingForDelivering: 24,
  OrderStatus.delivering: 28,
  OrderStatus.delivered: 32,
  OrderStatus.completedByUser: 36,
  OrderStatus.completedBySystem: 40,
  OrderStatus.lost: 44,
};
