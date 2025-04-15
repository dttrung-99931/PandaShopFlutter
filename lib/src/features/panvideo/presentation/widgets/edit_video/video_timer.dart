// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTimer extends StatelessWidget {
  const VideoTimer({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  String _getFormattedDuration() {
    return '${FormatUtils.formatDuration(controller.value.position.inSeconds)} / ${FormatUtils.formatDuration(controller.value.duration.inSeconds)}';
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidgetBuilder(
      getValue: (VideoPlayerController controller) {
        return _getFormattedDuration();
      },
      controller: controller,
      builder: (context, videoTime) {
        return Text(
          videoTime,
          style: textTheme.bodySmall.withColor(AppColors.white),
        );
      },
    );
  }
}
