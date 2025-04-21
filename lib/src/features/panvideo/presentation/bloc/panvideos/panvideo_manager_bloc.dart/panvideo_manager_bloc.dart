import 'dart:async';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_communicaton.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'panvideo_manager_event.dart';
part 'panvideo_manager_state.dart';

enum ScrollDirection { up, down }

PanvideoManagerBloc get panvideoManagerBloc => getIt();

@lazySingleton
class PanvideoManagerBloc extends BaseBloc {
  PanvideoManagerBloc() : super(InitialState()) {
    on<OnInitVideoController>(_onInitVideoController);
    onLoad<OnLoadPanvideo>(_onLoadPanvideo);
    on<OnPreloadPanvideo>(_onPreloadPanvideo, transformer: BlocConcurrency.sequential());
    on<OnAddPanvideoDatasources>(_onAddPanvideoDatasources);
    on<OnPlayPanvideo>(_onPlayVideo);
    on<OnPausePanvideo>(_onPauseVideo);
  }

  static get maxCacheedDatasources => 10;

  @override
  PanvideoManagerCommunication get blocCommunication => getIt<PanvideoManagerCommunication>();

  late BetterPlayerController _videoController;

  int _currentVideoIndex = -1;

  // Hold all datasources will be played
  final List<VideoDatasource> _datasources = [];

  // Hold datasources that have been cached
  final List<VideoDatasource> _cachedDatasources = [];

  int _firstCachePanvideoIdx = -1, _lastCachePanvideoIdx = -1;
  int get cacheControllerNum => _lastCachePanvideoIdx - _firstCachePanvideoIdx + 1;

  final Set<int> _pendingPlayedVideoIdxList = {};

  Future<void> _onInitVideoController(OnInitVideoController event, Emitter<BaseState> emit) async {
    _videoController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: event.aspectRatio,
        fullScreenAspectRatio: event.aspectRatio,
        looping: true,
        fit: BoxFit.fill,
        autoDispose: false,
        expandToFill: true,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          showControls: false, // use custom controls
          // icon
        ),
      ),
    );
    emit(InitVideoControllerSuccess(controller: _videoController));
  }

  Future<void> _onAddPanvideoDatasources(OnAddPanvideoDatasources event, Emitter<BaseState> emit) async {
    // TODO: addAll when handle loading more
    _datasources.assignAll(event.datasources);
  }

  Future<void> _onLoadPanvideo(OnLoadPanvideo event, Emitter<BaseState> emit) async {
    if (_currentVideoIndex != -1) {
      await _pauseVideo(_currentVideoIndex);
    }
    if (event.videoIndex == _currentVideoIndex) {
      return;
    }
    _currentVideoIndex = event.videoIndex;
    if (_videoController.betterPlayerDataSource != _datasources[event.videoIndex]) {
      await _setupCurrentDataSource(event.videoIndex, event.direction);
    }
    await _handlePlaying(event, emit);
  }

  Future<void> _setupCurrentDataSource(int videoIndex, ScrollDirection direction) async {
    await _videoController.setupDataSource(
      await getDatasource(videoIndex, direction),
    );
  }

  Future<void> _handlePlaying(OnLoadPanvideo event, Emitter<BaseState> emit) async {
    if (event.playAfterLoaded || _pendingPlayedVideoIdxList.contains(event.videoIndex)) {
      await _playVideo(event.videoIndex, emit);
    }
  }

  Future<void> _onPlayVideo(OnPlayPanvideo event, Emitter<BaseState> emit) async {
    await _playVideo(event.videoIndex, emit);
  }

  Future<void> _onPauseVideo(OnPausePanvideo event, Emitter<BaseState> emit) async {
    _pauseVideo(event.videoIndex);
  }

  Future<void> _playVideo(int videoIndex, Emitter<BaseState> emit) async {
    emit(PanvideoPlaying(videoIndex: videoIndex));
    final BetterPlayerDataSource? datasource = _getCachedDatasource(videoIndex);
    if (datasource != null &&
        _videoController.betterPlayerDataSource == datasource &&
        _videoController.isPlaying() != true) {
      _pendingPlayedVideoIdxList.remove(videoIndex);
      await _videoController.play();
    } else {
      _pendingPlayedVideoIdxList.add(videoIndex);
    }
    emit(PanvideoPlayed(videoIndex: videoIndex));
  }

  Future<void> _pauseVideo(int videoIndex) async {
    final BetterPlayerDataSource? datasource = _getCachedDatasource(videoIndex);
    if (datasource != null &&
        _videoController.betterPlayerDataSource == datasource &&
        _videoController.isPlaying() == true) {
      _videoController.pause();
    }
    _pendingPlayedVideoIdxList.remove(videoIndex);
  }

  BetterPlayerDataSource? _getCachedDatasource(int videoIndex) {
    if (videoIndex >= _firstCachePanvideoIdx && videoIndex <= _lastCachePanvideoIdx) {
      return _cachedDatasources[videoIndex - _firstCachePanvideoIdx];
    }
    return null;
  }

  Future<BetterPlayerDataSource> getDatasource(int videoIndex, ScrollDirection direction) async {
    BetterPlayerDataSource? datasource = _getCachedDatasource(videoIndex);
    if (datasource != null) {
      return datasource;
    }

    if (cacheControllerNum >= maxCacheedDatasources) {
      await _freeCachedDatasource(direction);
    }
    return _markDatasourceCached(videoIndex);
  }

  Future<void> _onPreloadPanvideo(OnPreloadPanvideo event, Emitter<BaseState> emit) async {
    int videoIndex = event.videoIndex;
    if (_getCachedDatasource(videoIndex) != null) {
      return;
    }

    if (cacheControllerNum >= maxCacheedDatasources) {
      await _freeCachedDatasource(event.direction);
    }
    final datasource = _markDatasourceCached(videoIndex);
    await _preLoad(datasource, videoIndex, event.direction);
  }

  Future<void> _preLoad(VideoDatasource datasource, int videoIndex, ScrollDirection direction) async {
    logd('Preload video $videoIndex');
    await Future.wait([
      precacheImage(ExtendedNetworkImageProvider(datasource.thumbImageUrl), Global.context),

      // Use setupDatasource for preCache seem to be more efficiant
      _setupCurrentDataSource(videoIndex, direction)
      // _videoController.preCache(datasource)
    ]);

    logd('Preloaded video $videoIndex');
  }

  Future<void> _freeCachedDatasource(ScrollDirection direction) async {
    final BetterPlayerDataSource datasource;
    if (direction == ScrollDirection.down) {
      datasource = _cachedDatasources.removeAt(0);
      _firstCachePanvideoIdx++;
    } else {
      // up direction
      datasource = _cachedDatasources.removeLast();
      _lastCachePanvideoIdx--;
    }
    // TODO: paiuse & clear cache
    // if (datasource.isPlaying() == true) {
    //   datasource.pause();
    // }
    // datasource.dispose();
  }

  VideoDatasource _markDatasourceCached(int videoIndex) {
    final datasource = _datasources[videoIndex];
    if (videoIndex == _lastCachePanvideoIdx + 1) {
      _cachedDatasources.add(datasource);
      _lastCachePanvideoIdx = videoIndex;
      // In case of first video controller added
      if (_firstCachePanvideoIdx == -1) {
        _firstCachePanvideoIdx = videoIndex;
      }
    }
    if (videoIndex == _firstCachePanvideoIdx - 1) {
      _cachedDatasources.insert(0, datasource);
      _firstCachePanvideoIdx = videoIndex;
    }
    return datasource;
  }

  @disposeMethod
  @override
  Future<void> close() async {
    if (_datasources.isEmpty) {
      return;
    }
    _datasources.clear();
    _videoController.dispose(forceDispose: true);
    super.close();
  }
}
