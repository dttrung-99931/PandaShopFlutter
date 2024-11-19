import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/core/controllers/map_tracking_controller.dart';
import 'package:panda_map/core/models/map_current_location.dart';

@lazySingleton
class MapTrackingUsecase {
  late final MapTrackingController trackingController = MapTrackingController();

  Future<Either<Failure, void>> updateCurrentLocation(MapCurrentLocation location) async {
    return executeWithTryCatch(() async {
      trackingController.updateCurrentLocation(location);
    });
  }

  Future<Either<Failure, void>> startTracking(MapTrackingOptions options) async {
    return executeWithTryCatch(() async {
      trackingController.startTracking(options);
    });
  }

  Future<Either<Failure, void>> stopTracking() async {
    return executeWithTryCatch(() async {
      trackingController.stopTracking();
    });
  }
}
