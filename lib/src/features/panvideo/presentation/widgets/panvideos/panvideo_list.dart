import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_manager.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PanvideoList extends StatefulWidget {
  const PanvideoList({
    super.key,
    required this.panvideos,
    required this.scrollController,
  });
  final List<PanvideoDto> panvideos;
  final ScrollController scrollController;

  @override
  State<PanvideoList> createState() => _PanvideoListState();
}

class _PanvideoListState extends State<PanvideoList> {
  final PanvideoManager _videoManager = panvideosBloc.panvideoManager;
  int _currentIndex = -1;

  VideoPlayerController? _controller;
  VideoPlayerValue get playerValue => _controller!.value;

  bool _isPlayingInprogress = false;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.panvideos.length,
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      itemBuilder: (context, index) {
        final panvideo = widget.panvideos[index];
        final direction = index >= _currentIndex ? ScrollDirection.down : ScrollDirection.up;
        _currentIndex = index;
        _setCurrentController(_videoManager.getCurrentController(index, direction));
        return PanvideoPage(
          panvideo: panvideo,
          videoController: _controller!,
        );
      },
    );
  }

  Future<void> _checkToPlayVideo() async {
    if (!mounted) {
      return;
    }
    if (playerValue.isInitialized && !playerValue.isPlaying) {
      _isPlayingInprogress = true;
      await _controller?.play();
    }
    if (_isPlayingInprogress) {
      // Update playing in progres
      _isPlayingInprogress = !playerValue.isPlaying;
    }
  }

  void _setCurrentController(VideoPlayerController currentController) {
    _controller?.removeListener(_checkToPlayVideo);
    _controller?.pause();
    if (currentController.value.isInitialized) {
      if (!currentController.value.isPlaying) {
        currentController.play();
      }
    } else {
      currentController.addListener(_checkToPlayVideo);
    }
    _controller = currentController;
  }
}
