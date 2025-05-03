import 'dart:async';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/better_player_controller_extension.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/video_player_configuration.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PanvideoManager {
  static const int maxCachedDatasources = 10;

  late BetterPlayerController _videoController;

  VideoPlayerValue get controllerValue => _videoController.videoPlayerController!.value;
  Duration get videoPosition => controllerValue.position;

  int _currentVideoIndex = -1;

  // Hold all datasources will be played
  final List<VideoDatasource> _datasources = [];

  // Hold datasources that have been cached
  final List<VideoDatasource> _cachedDatasources = [];

  int _firstCachePanvideoIdx = -1, _lastCachePanvideoIdx = -1;
  int get cacheControllerNum => _lastCachePanvideoIdx - _firstCachePanvideoIdx + 1;

  final Set<int> _pendingPlayedVideoIdxList = {};

  late VideoPlayerConfiguration _configuration;

  Future<BetterPlayerController> initVideoController({
    required VideoPlayerConfiguration configuration,
  }) async {
    double volume = configuration.volumne;
    assert(volume >= 0 && volume <= 1, 'Volume must be between 0 and 1');
    _configuration = configuration;
    _videoController = BetterPlayerController(configuration.baseConfiguration);
    return _videoController;
  }

  void setPanvideoDatasources(List<VideoDatasource> datasources) {
    _datasources.assignAll(datasources);
  }

  Future<void> loadPanvideo({
    required int videoIndex,
    required ScrollDirection direction,
    bool playAfterLoaded = false,
    VoidCallback? onPrePlayVideo,
    VoidCallback? onPostPlayVideo,
    double volumne = Constants.defaultVolumne,
  }) async {
    if (videoIndex == _currentVideoIndex) {
      return;
    }
    if (_currentVideoIndex != -1) {
      await pauseVideo(_currentVideoIndex);
    }
    _currentVideoIndex = videoIndex;
    if (_videoController.betterPlayerDataSource != _datasources[videoIndex]) {
      await _setupCurrentDataSource(videoIndex, direction);
      await _videoController.seekTo(Duration.zero);
      await _videoController.setVolume(volumne);
    }
    if (playAfterLoaded || _pendingPlayedVideoIdxList.contains(videoIndex)) {
      onPrePlayVideo?.call();
      await playVideo(videoIndex);
      onPostPlayVideo?.call();
    }
  }

  Future<void> playVideo(int videoIndex) async {
    final BetterPlayerDataSource? datasource = _getCachedDatasource(videoIndex);
    if (datasource != null &&
        _videoController.betterPlayerDataSource == datasource &&
        !_videoController.isPlayingSafe) {
      _pendingPlayedVideoIdxList.remove(videoIndex);
      await _videoController.play();
    } else {
      _pendingPlayedVideoIdxList.add(videoIndex);
    }
  }

  Future<void> pauseVideo(int videoIndex) async {
    final BetterPlayerDataSource? datasource = _getCachedDatasource(videoIndex);
    if (datasource != null && _videoController.isPlayingSafe) {
      _videoController.pause();
    }
    _pendingPlayedVideoIdxList.remove(videoIndex);
  }

  Future<void> preloadPanvideo(int videoIndex, ScrollDirection direction) async {
    if (_getCachedDatasource(videoIndex) != null) {
      return;
    }

    if (cacheControllerNum >= maxCachedDatasources) {
      await _freeCachedDatasource(direction);
    }
    final datasource = _markDatasourceCached(videoIndex);
    await _preLoad(datasource, videoIndex, direction);
  }

  Future<void> _setupCurrentDataSource(int videoIndex, ScrollDirection direction) async {
    await _videoController.setupDataSource(
      await getDatasource(videoIndex, direction),
    );
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

    if (cacheControllerNum >= maxCachedDatasources) {
      await _freeCachedDatasource(direction);
    }
    return _markDatasourceCached(videoIndex);
  }

  Future<void> _preLoad(VideoDatasource datasource, int videoIndex, ScrollDirection direction) async {
    logd('Preload video $videoIndex');
    await Future.wait([
      precacheImage(ExtendedNetworkImageProvider(datasource.thumbImageUrl), Global.context),
      _setupCurrentDataSource(videoIndex, direction),
    ]);
    logd('Preloaded video $videoIndex');
  }

  Future<void> _freeCachedDatasource(ScrollDirection direction) async {
    if (direction == ScrollDirection.down) {
      _cachedDatasources.removeAt(0);
      _firstCachePanvideoIdx++;
    } else {
      _cachedDatasources.removeLast();
      _lastCachePanvideoIdx--;
    }
  }

  VideoDatasource _markDatasourceCached(int videoIndex) {
    final datasource = _datasources[videoIndex];
    if (videoIndex == _lastCachePanvideoIdx + 1) {
      _cachedDatasources.add(datasource);
      _lastCachePanvideoIdx = videoIndex;
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

  Future<void> dispose() async {
    _datasources.clear();
    _videoController.dispose(forceDispose: true);
  }

  Future<void> setVolumne(double volume) async {
    await _videoController.setVolume(volume);
  }
}

enum ScrollDirection { up, down }

class VideoDatasource extends BetterPlayerDataSource {
  final String thumbImageUrl;

  VideoDatasource(
    super.type,
    super.source, {
    required this.thumbImageUrl,
    super.cacheConfiguration,
    super.bufferingConfiguration,
    super.videoFormat,
  });

  List<Object?> get props => [type, super.url, thumbImageUrl];
}
