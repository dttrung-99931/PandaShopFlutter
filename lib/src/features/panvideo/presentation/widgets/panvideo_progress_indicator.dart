// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanvideoProgressIndicator extends StatelessWidget {
  const PanvideoProgressIndicator({
    super.key,
    required this.controller,
    required this.playedColor,
  });
  final BetterPlayerController controller;
  final Color playedColor;

  @override
  Widget build(BuildContext context) {
    return ProgressIndicatorTheme(
      data: ProgressIndicatorThemeData(
        linearMinHeight: 2.5.h, // progress stroke width
      ),
      child: const SizedBox(),
    );
  }
}
