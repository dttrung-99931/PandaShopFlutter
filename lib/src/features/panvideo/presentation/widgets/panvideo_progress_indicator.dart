// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_event_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanvideoProgressIndicator extends StatefulWidget {
  const PanvideoProgressIndicator({
    super.key,
    required this.controller,
    required this.playedColor,
  });
  final BetterPlayerController controller;
  final Color playedColor;

  @override
  State<PanvideoProgressIndicator> createState() => _PanvideoProgressIndicatorState();
}

class _PanvideoProgressIndicatorState extends State<PanvideoProgressIndicator> {
  VideoPlayerController? _videoController;
  Color _playedColor = AppColors.primary;
  Color _bufferColor = AppColors.primary.withAlpha(80);
  bool _isSeeking = false;
  bool get _isProgressShowing => _playedColor != AppColors.transparent;

  Timer? _hideProgressTimer;

  @override
  void dispose() {
    _hideProgressTimer?.cancel();
    super.dispose();
  }

  _onPlayerEvent(BetterPlayerEvent event) {
    bool hasUpdate = false;
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.bufferingStart:
        if (!_isProgressShowing) {
          _showProgress();
          hasUpdate = true;
        }
        break;

      case BetterPlayerEventType.bufferingEnd:
        if (!_isProgressShowing) {
          break;
        }
        if (_isSeeking) {
          _hideProgressTimer?.cancel();
          _hideProgressTimer = Timer(1000.milliseconds, () {
            if (!mounted) return;
            _isSeeking = false;
            _hideProgress();
            setState(() {});
          });
        } else {
          _hideProgress();
          hasUpdate = true;
        }
        break;
      default:
    }
    if (widget.controller.videoPlayerController != _videoController) {
      _videoController = widget.controller.videoPlayerController;
      hasUpdate = true;
    }
    if (hasUpdate) {
      setState(() {});
    }
  }

  void _showProgress() {
    _playedColor = AppColors.primary;
    _bufferColor = AppColors.primary.withAlpha(80);
  }

  void _hideProgress() {
    _playedColor = AppColors.transparent;
    _bufferColor = AppColors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _isSeeking = true;
        if (!_isProgressShowing) {
          _showProgress();
          setState(() {});
        }
      },
      child: PanvideoEventListener(
        controller: widget.controller,
        eventListener: _onPlayerEvent,
        child: ProgressIndicatorTheme(
          data: ProgressIndicatorThemeData(
            linearMinHeight: 2.5.h, // progress stroke width
          ),
          child: _videoController != null
              ? VideoProgressIndicator(
                  _videoController!,
                  colors: VideoProgressColors(
                    backgroundColor: AppColors.transparent,
                    playedColor: _playedColor,
                    bufferedColor: _bufferColor,
                  ),
                  allowScrubbing: true,
                  padding: const EdgeInsets.only(top: 48),
                )
              : emptyWidget,
        ),
      ),
    );
  }
}
