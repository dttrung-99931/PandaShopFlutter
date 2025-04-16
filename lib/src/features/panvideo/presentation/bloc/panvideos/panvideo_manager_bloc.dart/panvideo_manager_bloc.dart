import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_communicaton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

part 'panvideo_manager_event.dart';
part 'panvideo_manager_state.dart';

enum ScrollDirection { up, down }

PanvideoManagerBloc get panvideoManagerBloc => getIt();

@lazySingleton
class PanvideoManagerBloc extends BaseBloc {
  PanvideoManagerBloc() : super(InitialState()) {
    onLoad<OnGetVideoController>(_onGetVideoController);
    on<OnPreloadPanvideo>(_onPreloadPanvideo, transformer: BlocConcurrency.sequential());
    on<OnPanvideosAdded>(_onPanvideosAdded);
    on<OnPlayPanvideo>(_onPlayVideo);
    on<OnPausePanvideo>(_onPauseVideo);
  }

  @override
  PanvideoManagerCommunication get blocCommunication => getIt<PanvideoManagerCommunication>();

  static get maxCacheControllers => 2;
  final List<PanvideoDto> _panvideos = [];
  final List<VideoPlayerController> _controllers = [];
  int _firstCachePanvideoIdx = -1, _lastCachePanvideoIdx = -1;
  int get cacheControllerNum => _lastCachePanvideoIdx - _firstCachePanvideoIdx + 1;

  int _currentVideoIndex = -1;
  final Set<int> _pendingPlayedVideoIdxList = {};

  Future<void> _onPanvideosAdded(OnPanvideosAdded event, Emitter<BaseState> emit) async {
    // TODO: addAll when handle loading more
    _panvideos.assignAll(event.panvideos);
  }

  Future<void> _onGetVideoController(OnGetVideoController event, Emitter<BaseState> emit) async {
    if (_currentVideoIndex != -1) {
      await _pauseVideo(_currentVideoIndex);
    }
    _currentVideoIndex = event.videoIndex;
    final controller = await getController(event.videoIndex, event.direction);
    _loadVideo(controller, event.videoIndex, event.direction);
    emit(GetVideoControllerSuccess(controller: controller, videoIndex: event.videoIndex));
  }

  Future<void> _onPlayVideo(OnPlayPanvideo event, Emitter<BaseState> emit) async {
    _playVideo(event.videoIndex);
  }

  Future<void> _onPauseVideo(OnPausePanvideo event, Emitter<BaseState> emit) async {
    _pauseVideo(event.videoIndex);
  }

  void _playVideo(int videoIndex) {
    final VideoPlayerController? controller = getCachedController(videoIndex);
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      _pendingPlayedVideoIdxList.add(videoIndex);
      return;
    }
    if (!controller.value.isPlaying) {
      controller.play();
      logd('Play $videoIndex');
    }
  }

  Future<void> _pauseVideo(int videoIndex) async {
    final VideoPlayerController? controller = getCachedController(videoIndex);
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      _pendingPlayedVideoIdxList.remove(videoIndex);
      return;
    }
    if (controller.value.isPlaying) {
      await controller.pause();
    }
  }

  VideoPlayerController? getCachedController(int videoIndex) {
    if (videoIndex >= _firstCachePanvideoIdx && videoIndex <= _lastCachePanvideoIdx) {
      return _controllers[videoIndex - _firstCachePanvideoIdx];
    }
    return null;
  }

  Future<VideoPlayerController> getController(int videoIndex, ScrollDirection direction) async {
    VideoPlayerController? controller = getCachedController(videoIndex);
    if (controller != null) {
      return controller;
    }

    if (cacheControllerNum >= maxCacheControllers) {
      _freeCacheController(direction);
    }
    return _addVideoController(videoIndex);
  }

  Future<void> _onPreloadPanvideo(OnPreloadPanvideo event, Emitter<BaseState> emit) async {
    int nextIndex = event.direction == ScrollDirection.down ? event.curVideoIndex + 1 : event.curVideoIndex - 1;
    if (nextIndex < 0 || nextIndex >= _panvideos.length) {
      return;
    }

    if (cacheControllerNum >= maxCacheControllers) {
      await _freeCacheController(event.direction);
    }
    final controller = _addVideoController(nextIndex);
    await _loadVideo(controller, nextIndex, event.direction);
  }

  Future<void> _loadVideo(VideoPlayerController controller, int videoIndex, ScrollDirection direction) async {
    if (controller.value.isInitialized) {
      return;
    }
    logd('Start load $videoIndex');
    await controller.initialize();
    if (_pendingPlayedVideoIdxList.contains(videoIndex)) {
      logd('Play $videoIndex');
      if (controller.value.isInitialized) {
        controller.play();
      }
    }
    logd('Finish load $videoIndex');
  }

  Future<void> _freeCacheController(ScrollDirection direction) async {
    final VideoPlayerController controller;
    if (direction == ScrollDirection.down) {
      controller = _controllers.removeAt(0);
      _firstCachePanvideoIdx++;
    } else {
      // up direction
      controller = _controllers.removeLast();
      _lastCachePanvideoIdx--;
    }
    if (controller.value.isPlaying) {
      controller.pause();
    }
    controller.dispose();
  }

  VideoPlayerController _addVideoController(int videoIndex) {
    final controller = _createVideoController(videoIndex);
    controller.setLooping(true);
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

  @disposeMethod
  void disposed() {
    if (_panvideos.isEmpty) {
      return;
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    _panvideos.clear();
    _controllers.clear();
  }
}
