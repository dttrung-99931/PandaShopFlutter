// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_location_response_model.dart';

class DeliveryLocationDto {
  final DeliveryLocationType locationType;
  final AddressDto address;
  DeliveryLocationDto({
    required this.locationType,
    required this.address,
  });

  factory DeliveryLocationDto.fromModel(DeliveryLocationResponseModel model) {
    return DeliveryLocationDto(
      locationType: model.locationType,
      address: AddressDto.fromModel(model.address),
    );
  }
}
