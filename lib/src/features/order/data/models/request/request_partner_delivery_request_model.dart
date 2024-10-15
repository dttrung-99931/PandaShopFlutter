// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'request_partner_delivery_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class RequestPartnerDeliveryRequestModel {
  final int deliveryMethodId;
  final int deliveryPartnerUnitAddressId;
  final int deliveryPartnerUnitId;
  final List<int> orderIds;

  RequestPartnerDeliveryRequestModel({
    required this.deliveryMethodId,
    required this.deliveryPartnerUnitAddressId,
    required this.deliveryPartnerUnitId,
    required this.orderIds,
  });

  Map<String, dynamic> toJson() => _$RequestPartnerDeliveryRequestModelToJson(this);
}
