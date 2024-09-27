// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_location_response_model.g.dart';

@JsonSerializable(createToJson: false)
class DeliveryLocationResponseModel {
  final DeliveryLocationType locationType;
  final AddressModel address;
  DeliveryLocationResponseModel({
    required this.locationType,
    required this.address,
  });
  factory DeliveryLocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryLocationResponseModelFromJson(json);
}

enum DeliveryLocationType {
  @JsonValue(2)
  pickup,
  // Delivery to customers
  @JsonValue(4)
  delivery,
  // Delivery partner location
  @JsonValue(8)
  deliveryPartner
}
