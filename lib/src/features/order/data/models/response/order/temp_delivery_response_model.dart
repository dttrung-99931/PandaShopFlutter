// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';

part 'temp_delivery_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TempDeliveryResponseModel {
  final List<OrderResponseModel> orders;
  final AddressModel deliveryPartnerUnitAddress;
  final int deliveryPartnerUnitId;
  final int deliveryMethodId;

  TempDeliveryResponseModel({
    required this.orders,
    required this.deliveryPartnerUnitAddress,
    required this.deliveryPartnerUnitId,
    required this.deliveryMethodId,
  });

  factory TempDeliveryResponseModel.fromJson(Map<String, dynamic> json) => _$TempDeliveryResponseModelFromJson(json);
}
