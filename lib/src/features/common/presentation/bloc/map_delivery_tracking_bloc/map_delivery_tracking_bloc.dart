// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/extensions/map_extension.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_communicaton.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_progress_update_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/core/controllers/map_tracking_controller.dart';

import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/map/map_tracking_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map/base_map_bloc.dart';

part 'map_delivery_tracking_event.dart';
part 'map_delivery_tracking_state.dart';

MapDeliveryTrackingBloc get mapDeliveryTrackingBloc => getIt<MapDeliveryTrackingBloc>();

@lazySingleton
class MapDeliveryTrackingBloc extends BaseMapBloc with AddressBlocMixin {
  MapDeliveryTrackingBloc(
    this._mapTrackingUsecase,
  ) : super() {
    onLoad<OnStartDeliveryTracking>(_onStartDeliveryTracking);
    on<OnStopDeliveryTracking>(_onStopDeliveryTracking);
    on<OnMapDeliveryProgressUpdate>(_onMapDeliveryProgressUpdate);
  }
  @override
  BlocCommunication get blocCommunication => getIt<MapDeliveryTrackingCommunication>();

  final MapTrackingUsecase _mapTrackingUsecase;
  MapTrackingController get trackingController => _mapTrackingUsecase.trackingController;

  int? _currentTrackingDelivery;
  int? get currentTrackingDelivery => _currentTrackingDelivery;

  FutureOr<void> _onStartDeliveryTracking(OnStartDeliveryTracking event, Emitter<BaseState> emit) async {
    _currentTrackingDelivery = event.deliveryId;
  }

  FutureOr<void> _onStopDeliveryTracking(OnStopDeliveryTracking event, Emitter<BaseState> emit) async {
    _currentTrackingDelivery = null;
  }

  FutureOr<void> _onMapDeliveryProgressUpdate(OnMapDeliveryProgressUpdate event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _mapTrackingUsecase.updateCurrentLocation(event.progress.progress.driverLocation),
      emit: emit.call,
    );
  }
}
