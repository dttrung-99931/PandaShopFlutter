// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panda_map/widgets/loading_widget.dart';

class PanMusicItem extends StatelessWidget {
  const PanMusicItem({
    super.key,
    required this.music,
  });

  final PanMusicDto music;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.whiteLight,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.music_note_outlined, color: AppColors.white, size: 24.r),
          8.swb,
          Expanded(
            child: Text(
              music.title,
              style: textTheme.bodyMedium.withColor(AppColors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomBlocBuilder<PanMusicPlayerBloc>(
            buildForStates: const [
              PanMusicLoading,
              PanMusicPlaying,
              PanMusicPaused,
              PanMusicError,
            ],
            buildCondition: (state) => (state is PanMusicState && state.music == music) || state is ErrorState,
            builder: (state) {
              bool isLoading = state is PanMusicLoading && state.music == music;
              return IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (panMusicPlayerBloc.playingMusic != music) {
                    panMusicPlayerBloc.add(OnPlayPanMusic(music));
                  } else {
                    panMusicPlayerBloc.add(OnPausePanMusic(music));
                  }
                },
                icon: isLoading
                    ? const LoadingWidget()
                    : Icon(
                        state is PanMusicPlaying && state.music == music ? Icons.pause : Icons.play_arrow,
                        color: AppColors.white,
                        size: 24.r,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
