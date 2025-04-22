// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/better_player_controller_extension.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_player_widget.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/delayed_hidden_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanvideoPlayPauseButton extends StatefulWidget {
  const PanvideoPlayPauseButton({super.key, required this.controller});
  final BetterPlayerController controller;

  @override
  State<PanvideoPlayPauseButton> createState() => _PanvideoPlayPauseButtonState();
}

class _PanvideoPlayPauseButtonState extends State<PanvideoPlayPauseButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidgetBuilder(
      controller: widget.controller,
      getValue: (controller) => controller.isPlayingSaffe,
      builder: (context, isPlaying) {
        onPressed() {
          isPressed = true;
          if (isPlaying) {
            widget.controller.pause();
          } else {
            widget.controller.play();
          }
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            !isPressed
                ? emptyWidget
                : DelayedHiddenWidget(
                    onCompleteHidden: () {
                      isPressed = false;
                    },
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: onPressed,
                      backgroundColor: Colors.black26,
                      shape: const CircleBorder(),
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppColors.white,
                        size: (isPlaying ? 44 : 48).r,
                      ),
                    ),
                  ),
            Positioned.fill(
              child: GestureDetector(
                onTap: onPressed,
              ),
            ),
          ],
        );
      },
    );
  }
}
