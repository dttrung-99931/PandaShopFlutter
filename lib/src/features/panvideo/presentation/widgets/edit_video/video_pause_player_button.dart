// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPauseButton extends StatelessWidget {
  const VideoPlayPauseButton({super.key, required this.controller});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidgetBuilder(
      controller: controller,
      getValue: (controller) => controller.value.isPlaying,
      builder: (context, isPlaying) {
        return FloatingActionButton(
          elevation: 0,
          onPressed: () {
            if (isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          backgroundColor: Colors.white38,
          shape: const CircleBorder(),
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: AppColors.black,
            size: (isPlaying ? 44 : 48).r,
          ),
        );
      },
    );
  }
}
