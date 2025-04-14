// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetOrdersRequestModelToJson(
        GetOrdersRequestModel instance) =>
    <String, dynamic>{
      if (instance.userId case final value?) 'userId': value,
      if (instance.shopId case final value?) 'shopId': value,
      if (_$OrderStatusEnumMap[instance.status] case final value?)
        'status': value,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.created: 1,
  OrderStatus.pending: 4,
  OrderStatus.processing: 12,
  OrderStatus.cancelledByBuyer: 16,
  OrderStatus.cancelledByShop: 20,
  OrderStatus.completeProcessing: 22,
  OrderStatus.waitingForDelivering: 24,
  OrderStatus.delivering: 28,
  OrderStatus.delivered: 32,
  OrderStatus.completedByUser: 36,
  OrderStatus.completedBySystem: 40,
  OrderStatus.lost: 44,
};
