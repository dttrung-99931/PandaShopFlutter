// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      id: (json['id'] as num).toInt(),
      note: json['note'] as String?,
      user:
          UserShortResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      deliveries: (json['deliveries'] as List<dynamic>)
          .map((e) => DeliveryResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderDetails: (json['orderDetails'] as List<dynamic>)
          .map((e) =>
              OrderDetailResponseModel.fromJson(e as Map<String, dynamic>))
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

OrderDetailResponseModel _$OrderDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    OrderDetailResponseModel(
      id: (json['id'] as num).toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      productNum: (json['productNum'] as num).toInt(),
      productOption: ProductOptionModel.fromJson(
          json['productOption'] as Map<String, dynamic>),
      product:
          ShortProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

ShortOrderDetailResponseModel _$ShortOrderDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShortOrderDetailResponseModel(
      productOptionName: json['productOptionName'] as String,
      productName: json['productName'] as String,
    );
