// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PanvideoProgressIndicator extends StatelessWidget {
  const PanvideoProgressIndicator({
    super.key,
    required this.controller,
    required this.playedColor,
  });
  final VideoPlayerController controller;
  final Color playedColor;

  @override
  Widget build(BuildContext context) {
    return ProgressIndicatorTheme(
      data: ProgressIndicatorThemeData(
        linearMinHeight: 2.5.h, // progress stroke width
      ),
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
        padding: EdgeInsets.only(top: 32.h), // Increasing touch area
        colors: VideoProgressColors(
          playedColor: playedColor,
          backgroundColor: AppColors.lightGrey,
        ),
      ),
    );
  }
}
