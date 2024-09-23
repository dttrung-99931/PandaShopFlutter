// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:here_panda_map/here_map_options.dart';
import 'package:here_panda_map/here_panda_map_pluggin.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/panda_map.dart';

part 'map_address_event.dart';
part 'map_address_state.dart';

MapAddressBloc get mapAddressBloc => getIt<MapAddressBloc>();

@lazySingleton
class MapAddressBloc extends BaseBloc with AddressBlocMixin {
  MapAddressBloc() : super(InitialState()) {
    onLoad<OnEnsureMapSdkInit>(_onEnsureMapSdkInit, transformer: BlocConcurrency.droppable());
    on<OnDisposeMapSDK>(_onDisposeMapSDK);
  }

  FutureOr<void> _onEnsureMapSdkInit(OnEnsureMapSdkInit event, Emitter<BaseState> emit) async {
    if (!PandaMap.isInitilized) {
      await PandaMap.initialize(
        plugin: HerePandaMapPluggin(
          options: HerePandaMapOptions(
            mapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
            mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
          ),
        ),
      );
    }
    emit(MapSDKInitilized());
  }

  FutureOr<void> _onDisposeMapSDK(OnDisposeMapSDK event, Emitter<BaseState> emit) {
    PandaMap.dispose();
  }
}
