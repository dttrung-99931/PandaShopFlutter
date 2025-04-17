// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_player_widget.dart';
import 'package:flutter/material.dart';

class VideoTimer extends StatelessWidget {
  const VideoTimer({
    super.key,
    required this.controller,
  });

  final BetterPlayerController controller;

  String _getFormattedDuration() {
    return '${FormatUtils.formatDuration(100)} / ${FormatUtils.formatDuration(1000)}';
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidgetBuilder(
      getValue: (BetterPlayerController controller) {
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
