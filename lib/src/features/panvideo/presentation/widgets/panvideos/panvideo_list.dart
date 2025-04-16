import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_page.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';

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
  int _currentIndex = -1;

  VideoPlayerController? _controller;
  VideoPlayerValue get playerValue => _controller!.value;

  // late PageController _pageController;

  @override
  void initState() {
    // _pageController.page;
    // _pageController = PageController(

    // );
    // _pageController.addListener(listener)
    super.initState();
  }

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
        panvideoManagerBloc.add(OnGetVideoController(videoIndex: index, direction: direction));
        // panvideoManagerBloc.add(OnPreloadPanvideo(curVideoIndex: index, direction: direction));
        return CustomBlocBuilder<PanvideoManagerBloc>(
          key: UniqueKey(),
          buildForStates: const [GetVideoControllerSuccess],
          buildCondition: (state) {
            return state is GetVideoControllerSuccess && state.videoIndex == index;
          },
          builder: (state) {
            if (state is! GetVideoControllerSuccess || state.videoIndex != index) {
              return const LoadingWidget();
            }
            _controller?.pause();
            final panvideo = widget.panvideos[index];
            return PanvideoPage(
              panvideo: panvideo,
              videoController: _controller = state.controller,
              videoIndex: index,
            );
          },
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
