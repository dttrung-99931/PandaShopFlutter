import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_communicaton.dart';
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

  @override
  PanvideoManagerCommunication get blocCommunication => getIt<PanvideoManagerCommunication>();

  static get maxCacheControllers => 2;
  final List<BetterPlayerDataSource> _datasources = [];
  final List<BetterPlayerDataSource> _cachedDatasources = [];

  late BetterPlayerController _videoController;

  int _firstCachePanvideoIdx = -1, _lastCachePanvideoIdx = -1;
  int get cacheControllerNum => _lastCachePanvideoIdx - _firstCachePanvideoIdx + 1;

  int _currentVideoIndex = -1;
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
          showControls: false,
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
    _currentVideoIndex = event.videoIndex;
    await _setupCurrentDataSource(event.videoIndex, event.direction);
    _handlePendingPlay(event.videoIndex);
  }

  Future<void> _setupCurrentDataSource(int videoIndex, ScrollDirection direction) async {
    await _videoController.setupDataSource(
      await getDatasource(videoIndex, direction),
    );
  }

  void _handlePendingPlay(int videoIndex) {
     if (_pendingPlayedVideoIdxList.contains(videoIndex)) {
      _videoController.play();
      _pendingPlayedVideoIdxList.remove(videoIndex);
    }
  }

  Future<void> _onPlayVideo(OnPlayPanvideo event, Emitter<BaseState> emit) async {
    _playVideo(event.videoIndex);
  }

  Future<void> _onPauseVideo(OnPausePanvideo event, Emitter<BaseState> emit) async {
    _pauseVideo(event.videoIndex);
  }

  Future<void> _playVideo(int videoIndex) async {
    final BetterPlayerDataSource? datasource = getCachedDatasource(videoIndex);
    if (datasource != null && _videoController.betterPlayerDataSource == datasource && _videoController.isPlaying() != true) {
      _videoController.play();
      return;
    }
    _pendingPlayedVideoIdxList.add(videoIndex);
  }

  Future<void> _pauseVideo(int videoIndex) async {
    final BetterPlayerDataSource? datasource = getCachedDatasource(videoIndex);
    if (datasource != null && _videoController.betterPlayerDataSource == datasource && _videoController.isPlaying() == true) {
      _videoController.pause();
    }
    _pendingPlayedVideoIdxList.remove(videoIndex);
  }

  BetterPlayerDataSource? getCachedDatasource(int videoIndex) {
    if (videoIndex >= _firstCachePanvideoIdx && videoIndex <= _lastCachePanvideoIdx) {
      return _cachedDatasources[videoIndex - _firstCachePanvideoIdx];
    }
    return null;
  }

  Future<BetterPlayerDataSource> getDatasource(int videoIndex, ScrollDirection direction) async {
    BetterPlayerDataSource? datasource = getCachedDatasource(videoIndex);
    if (datasource != null) {
      return datasource;
    }

    if (cacheControllerNum >= maxCacheControllers) {
      await _freeCacheedDatasource(direction);
    }
    return _cacheDatasource(videoIndex);
  }

  Future<void> _onPreloadPanvideo(OnPreloadPanvideo event, Emitter<BaseState> emit) async {
    int nextIndex = event.direction == ScrollDirection.down ? event.curVideoIndex + 1 : event.curVideoIndex - 1;
    if (nextIndex < 0 || nextIndex >= _datasources.length) {
      return;
    }

    if (cacheControllerNum >= maxCacheControllers) {
      await _freeCacheedDatasource(event.direction);
    }
    final controller = _cacheDatasource(nextIndex);
    await _preLoad(controller, nextIndex, event.direction);
  }

  Future<void> _preLoad(BetterPlayerDataSource datasource, int videoIndex, ScrollDirection direction) async {
    logd('Start load $videoIndex');
    await _videoController.preCache(datasource);
    if (_pendingPlayedVideoIdxList.contains(videoIndex)) {
      logd('Play $videoIndex');
      _videoController.play();
      _pendingPlayedVideoIdxList.remove(videoIndex);
    }
    logd('Finish load $videoIndex');
  }

  Future<void> _freeCacheedDatasource(ScrollDirection direction) async {
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

  BetterPlayerDataSource _cacheDatasource(int videoIndex) {
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
  void disposed() {
    if (_datasources.isEmpty) {
      return;
    }
    _datasources.clear();
    _videoController.pause();
    _videoController.dispose();
  }
}
