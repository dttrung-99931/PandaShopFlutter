// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      id: json['id'] as int,
      note: json['note'] as String?,
      subOrders: (json['subOrders'] as List<dynamic>)
          .map((e) => SubOrderResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: PaymentMethodModel.fromJson(
          json['paymentMethod'] as Map<String, dynamic>),
      user:
          UserShortResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
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
