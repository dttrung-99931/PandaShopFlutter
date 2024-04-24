// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubOrderResponseModel _$SubOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubOrderResponseModel(
      id: json['id'] as int,
      delivery: DeliveryResponseModel.fromJson(
          json['delivery'] as Map<String, dynamic>),
      note: json['note'] as String?,
      subOrderDetails: (json['subOrderDetails'] as List<dynamic>)
          .map((e) =>
              SubOrderDetailResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SubOrderDetailResponseModel _$SubOrderDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubOrderDetailResponseModel(
      id: json['id'] as int,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      productNum: json['productNum'] as int,
      productOption: ProductOptionModel.fromJson(
          json['productOption'] as Map<String, dynamic>),
      product:
          ShortProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );
