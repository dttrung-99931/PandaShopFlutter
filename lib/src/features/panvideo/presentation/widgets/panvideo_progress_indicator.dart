// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:awesome_video_player/awesome_video_player.dart';
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
