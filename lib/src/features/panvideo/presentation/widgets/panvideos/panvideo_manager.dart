import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

enum ScrollDirection { up, down }

@lazySingleton
class PanvideoManager {
  static get maxCacheControllers => 2;
  final List<PanvideoDto> _panvideos = [];
  final List<VideoPlayerController> _controllers = [];
  int _firstCachePanvideoIdx = -1, _lastCachePanvideoIdx = -1;
  int get cacheControllerNum => _lastCachePanvideoIdx - _firstCachePanvideoIdx + 1;

  int _currentPlayingIndex = -1;

  VideoPlayerController getCurrentController(int videoIndex, ScrollDirection direction) {
    if (videoIndex >= _firstCachePanvideoIdx && videoIndex <= _lastCachePanvideoIdx) {
      return _controllers[videoIndex - _firstCachePanvideoIdx];
    }

    if (cacheControllerNum >= maxCacheControllers) {
      _freeCacheController(direction);
    }
    final controller = _addVideoController(videoIndex);
    return controller;
  }

  void _freeCacheController(ScrollDirection direction) {
    if (direction == ScrollDirection.down) {
      final controller = _controllers.removeAt(0);
      controller.dispose();
      _firstCachePanvideoIdx++;
    } else {
      // up direction
      final controller = _controllers.removeLast();
      controller.dispose();
      _lastCachePanvideoIdx--;
    }
  }

  VideoPlayerController _addVideoController(int videoIndex) {
    final controller = _createVideoController(videoIndex);
    controller.initialize();
    if (videoIndex == _lastCachePanvideoIdx + 1) {
      _controllers.add(controller);
      _lastCachePanvideoIdx = videoIndex;
      // In case of first video controller added
      if (_firstCachePanvideoIdx == -1) {
        _firstCachePanvideoIdx = videoIndex;
      }
    }
    if (videoIndex == _firstCachePanvideoIdx - 1) {
      _controllers.insert(0, controller);
      _firstCachePanvideoIdx = videoIndex;
    }
    return controller;
  }

  VideoPlayerController _createVideoController(int videoIndex) {
    final panvideo = _panvideos[videoIndex];
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(panvideo.videoUrl),
    );
    return controller;
  }

  void addPanvideos(List<PanvideoDto> panvideos) {
    _panvideos.addAll(panvideos);
  }

  void clearPanvideos() {
    if (_panvideos.isEmpty) {
      return;
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    _panvideos.clear();
    _controllers.clear();
  }

  void setCurrentPlayingIndex(int index) {
    if (index > _currentPlayingIndex) {}

    _currentPlayingIndex = index;
  }

  @disposeMethod
  void disposed() {
    clearPanvideos();
  }
}
