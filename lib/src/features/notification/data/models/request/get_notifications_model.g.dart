// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetNotificationsModelToJson(
        GetNotificationsModel instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageNum': instance.pageNum,
      'status': _$OrderStatusEnumMap[instance.status],
      'onlyForShop': instance.onlyForShop,
    };

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
