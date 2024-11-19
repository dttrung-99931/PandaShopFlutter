// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_location_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_progress_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';

part 'delivery_with_orders_response_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class DeliveryWithOrdersResponseModel {
  final int id;
  final DeliveryStatus status;
  final DeliveryProgressResponseModel? progress;
  final List<OrderResponseModel> orders;
  final AddressModel deliveryPartnerUnitAddress;
  final List<DeliveryLocationResponseModel> deliveryLocations;

  DeliveryWithOrdersResponseModel({
    required this.id,
    required this.status,
    this.progress,
    required this.orders,
    required this.deliveryPartnerUnitAddress,
    required this.deliveryLocations,
  });

  factory DeliveryWithOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryWithOrdersResponseModelFromJson(json);
}
