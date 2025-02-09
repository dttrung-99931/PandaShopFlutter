// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:here_panda_map/here_map_options.dart';
import 'package:here_panda_map/here_panda_map_pluggin.dart';
import 'package:panda_map/panda_map.dart';

part 'base_map_event.dart';
part 'base_map_state.dart';

abstract class BaseMapBloc extends BaseBloc {
  BaseMapBloc() : super(InitialState()) {
    onLoad<OnEnsureMapSdkInit>(_onEnsureMapSdkInit, transformer: BlocConcurrency.droppable());
    on<OnDisposeMapSDK>(_onDisposeMapSDK);
  }

  FutureOr<void> _onEnsureMapSdkInit(OnEnsureMapSdkInit event, Emitter<BaseState> emit) async {
    if (!PandaMap.isInitilized) {
      await PandaMap.initialize(
        plugin: HerePandaMapPluggin(
          options: HerePandaMapOptions(
            mapAPIKey: AppConfig.config.hereMapAPIKey,
            mapAPIKeyId: AppConfig.config.hereMapAPIKeyId,
          ),
        ),
      );
    }
    emit(MapSDKInitilized());
  }

  FutureOr<void> _onDisposeMapSDK(OnDisposeMapSDK event, Emitter<BaseState> emit) {
    emit(MapSDKDisposed());
    PandaMap.dispose();
  }
}
