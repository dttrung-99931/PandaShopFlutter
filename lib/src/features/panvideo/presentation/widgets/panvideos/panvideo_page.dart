// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_action.dart';
import 'package:evievm_app/src/shared/widgets/app_image.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanvideoPage extends StatelessWidget {
  const PanvideoPage({
    super.key,
    required this.panvideo,
    required this.videoController,
    required this.videoIndex,
  });

  static const Duration fadeInDuration = Duration(milliseconds: 50);
  final PanvideoDto panvideo;
  final BetterPlayerController videoController;
  final int videoIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomBlocBuilder<PanvideoManagerBloc>(
            buildForStates: const [PanvideoPlaying],
            bloc: panvideoManagerBloc,
            handleLoading: false,
            builder: (state) {
              if (state is! PanvideoPlaying) {
                return emptyWidget;
              }
              return AppImage.network(
                panvideo.thumbImageUrl,
                fit: BoxFit.fill,
                fadeInDuration: fadeInDuration,
              );
            },
          ),
        ),
        Positioned.fill(
          child: CustomBlocBuilder<PanvideoManagerBloc>(
            buildForStates: const [PanvideoPlayed],
            bloc: panvideoManagerBloc,
            handleLoading: false,
            builder: (state) {
              if (state is PanvideoPlayed && state.videoIndex == videoIndex) {
                return BetterPlayer(
                  controller: videoController,
                );
              }
              return emptyWidget;
            },
          ),
        ),
        Positioned(
          right: 16.w,
          bottom: 0,
          child: Column(
            spacing: 20.h,
            children: [
              const PanvideoAction(
                count: 10,
                icon: Icons.thumb_up_outlined,
              ),
              const PanvideoAction(
                count: 2,
                icon: Icons.comment_outlined,
              ),
              const PanvideoAction(
                count: 4,
                icon: Icons.shopping_cart_checkout_outlined,
              ),
              SizedBox(height: 0.17.sh),
            ],
          ),
        ),

        // Second column: Title and description
        Positioned(
          bottom: 32.r,
          left: 16.r,
          right: 16.r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                panvideo.title,
                style: textTheme.titleMediumSm.withColor(AppColors.white).withHeight(1.4).bold(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                panvideo.description,
                style: textTheme.bodyLarge.withColor(AppColors.whiteLight),
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
