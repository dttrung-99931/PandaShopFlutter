import 'dart:async';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_communicaton.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/video_player_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'panvideo_manager_event.dart';
part 'panvideo_manager_state.dart';

PanvideoManagerBloc get panvideoManagerBloc => getIt();

@lazySingleton
class PanvideoManagerBloc extends BaseBloc {
  PanvideoManagerBloc(this.panvideoManager) : super(InitialState()) {
    on<OnInitVideoController>(_onInitVideoController);
    onLoad<OnLoadPanvideo>(_onLoadPanvideo);
    on<OnPreloadPanvideo>(_onPreloadPanvideo, transformer: BlocConcurrency.sequential());
    on<OnAddPanvideoDatasources>(_onAddPanvideoDatasources);
    on<OnPlayPanvideo>(_onPlayVideo);
    on<OnPausePanvideo>(_onPauseVideo);
  }
  final PanvideoManager panvideoManager;

  @override
  BlocCommunication? get blocCommunication => getIt<PanvideoManagerCommunication>();

  VideoPlayerConfiguration buildVideoConfiguration({
    required double aspectRatio,
  }) {
    return VideoPlayerConfiguration(
      baseConfiguration: BetterPlayerConfiguration(
        aspectRatio: aspectRatio,
        fullScreenAspectRatio: aspectRatio,
        looping: true,
        fit: BoxFit.fill,
        autoDispose: false,
        expandToFill: true,
        autoPlay: false,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          showControls: false,
        ),
      ),
      voulume: 0.4,
    );
  }

  Future<void> _onInitVideoController(OnInitVideoController event, Emitter<BaseState> emit) async {
    final controller = await panvideoManager.initVideoController(
      configuration: buildVideoConfiguration(aspectRatio: event.aspectRatio),
    );
    emit(InitVideoControllerSuccess(controller: controller));
  }

  Future<void> _onAddPanvideoDatasources(OnAddPanvideoDatasources event, Emitter<BaseState> emit) async {
    panvideoManager.addPanvideoDatasources(event.datasources);
  }

  Future<void> _onLoadPanvideo(OnLoadPanvideo event, Emitter<BaseState> emit) async {
    await panvideoManager.loadPanvideo(
      videoIndex: event.videoIndex,
      direction: event.direction,
      playAfterLoaded: event.playAfterLoaded,
      onPrePlayVideo: () {
        emit(PanvideoPlaying(videoIndex: event.videoIndex));
      },
      onPostPlayVideo: () {
        emit(PanvideoPlayed(videoIndex: event.videoIndex));
      },
    );
  }

  Future<void> _onPlayVideo(OnPlayPanvideo event, Emitter<BaseState> emit) async {
    emit(PanvideoPlaying(videoIndex: event.videoIndex));
    await panvideoManager.playVideo(event.videoIndex);
    emit(PanvideoPlayed(videoIndex: event.videoIndex));
  }

  Future<void> _onPauseVideo(OnPausePanvideo event, Emitter<BaseState> emit) async {
    await panvideoManager.pauseVideo(event.videoIndex);
  }

  Future<void> _onPreloadPanvideo(OnPreloadPanvideo event, Emitter<BaseState> emit) async {
    await panvideoManager.preloadPanvideo(event.videoIndex, event.direction);
  }

  @disposeMethod
  @override
  Future<void> close() async {
    await panvideoManager.dispose();
    super.close();
  }
}
