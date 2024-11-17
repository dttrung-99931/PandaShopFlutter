import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_progress_dto.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_location.dart';

extension AddressExt on AddressDto {
  MapLocation get mapLocation => MapLocation(lat: lat, long: long);
}

extension DeliveryProgressExt on DeliveryProgressDto {
  MapCurrentLocation get driverLocation => MapCurrentLocation(
        lat: driverLat,
        long: driverLong,
        bearingDegrees: driverBearingInDegree,
      );
}
