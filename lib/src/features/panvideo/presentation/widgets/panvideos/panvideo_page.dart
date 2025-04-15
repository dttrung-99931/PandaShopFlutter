// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PanvideoPage extends StatelessWidget {
  const PanvideoPage({
    super.key,
    required this.panvideo,
    required this.videoController,
  });

  final PanvideoDto panvideo;
  final VideoPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: VideoPlayer(videoController),
        ),
        Positioned(
          right: 16.w,
          bottom: 0,
          child: Column(
            spacing: 20.h,
            children: [
              const PanvideoAction(
                count: 10,
                icon: Icons.thumb_up,
              ),
              const PanvideoAction(
                count: 2,
                icon: Icons.comment,
              ),
              const PanvideoAction(
                count: 4,
                icon: Icons.shopping_cart_checkout_outlined,
              ),
              SizedBox(height: 0.16.sh),
            ],
          ),
        ),

        // Second column: Title and description
        Positioned(
          bottom: 24.r,
          left: 12.r,
          right: 12.r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                panvideo.title,
                style: textTheme.titleSmall.withColor(AppColors.whiteLight).withHeight(1.4).bold(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                panvideo.description,
                style: textTheme.bodyMedium.withColor(Colors.white60),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: PanvideoProgressIndicator(
            controller: videoController,
            playedColor: AppColors.primary,
          ),
        )
      ],
    );
  }
}
