import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_page.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  bool _wasFirstVideoIgnoredPreload = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      itemCount: widget.panvideos.length,
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      // Make dragging more reactive
      // dragStartBehavior: DragStartBehavior.down,
      preloadPagesCount: 2,
      itemBuilder: (context, index) {
        final panvideo = widget.panvideos[index];
        // Ignore preload first video because it no need
        if (index != 0 || !_wasFirstVideoIgnoredPreload) {
          // Preload vidoe
          panvideoManagerBloc.add(
            OnPreloadPanvideo(videoIndex: index, direction: _getScrollDirection(index)),
          );
        } else {
          _wasFirstVideoIgnoredPreload = true;
        }
        return VisibilityDetector(
          key: ValueKey(index),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.35 && index != _currentIndex) {
              _currentIndex = index;
              // Load right after when user dragging to new video
              panvideoManagerBloc.add(OnLoadPanvideo(
                videoIndex: index,
                direction: _getScrollDirection(index),
                playAfterLoaded: true,
              ));
            }
          },
          child: PanvideoPage(
            panvideo: panvideo,
            videoController: widget.videoController,
            videoIndex: index,
          ),
        );
      },
    );
  }

  ScrollDirection _getScrollDirection(int curIndex) {
    return curIndex >= _currentIndex ? ScrollDirection.down : ScrollDirection.up;
  }
}
