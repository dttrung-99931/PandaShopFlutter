import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';

class PanvideoList extends StatefulWidget {
  const PanvideoList({
    super.key,
    required this.panvideos,
    required this.scrollController,
    required this.videoController,
  });
  final List<PanvideoDto> panvideos;
  final ScrollController scrollController;
  final BetterPlayerController videoController;

  @override
  State<PanvideoList> createState() => _PanvideoListState();
}

class _PanvideoListState extends State<PanvideoList> {
  int _currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.panvideos.length,
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      onPageChanged: (index) {},
      // Make dragging more reactive
      dragStartBehavior: DragStartBehavior.down,
      itemBuilder: (context, index) {
        final direction = index >= _currentIndex ? ScrollDirection.down : ScrollDirection.up;
        _currentIndex = index;
        // Load right after when user dragging to new video
        panvideoManagerBloc.add(OnLoadPanvideo(videoIndex: index, direction: direction));
        final panvideo = widget.panvideos[index];

        return PanvideoPage(
          panvideo: panvideo,
          videoController: widget.videoController,
          videoIndex: index,
        );
      },
    );
  }

  // Future<void> _checkToPlayVideo() async {
  //   if (!mounted) {
  //     return;
  //   }
  //   if (playerValue.isInitialized && !playerValue.isPlaying) {
  //     _isPlayingInprogress = true;
  //     await _controller?.play();
  //   }
  //   if (_isPlayingInprogress) {
  //     // Update playing in progres
  //     _isPlayingInprogress = !playerValue.isPlaying;
  //   }
  // }

  // void _setCurrentController(VideoPlayerController currentController) {
  //   _controller?.removeListener(_checkToPlayVideo);
  //   _controller?.pause();
  //   _controller = currentController;
  //   if (currentController.value.isInitialized) {
  //     if (!currentController.value.isPlaying) {
  //       currentController.play();
  //     }
  //   } else {
  //     currentController.addListener(_checkToPlayVideo);
  //   }
  // }
}
