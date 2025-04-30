// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/music_select.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicButton extends StatelessWidget {
  const MusicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return MusicSelect(
              initSelectedMusic: createPanVideoBloc.selectedMusic,
              onSelectMusic: (music) {
                createPanVideoBloc.add(OnPanMusicSelected(music));
              },
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note_outlined, color: AppColors.white, size: 24.r),
            8.swb,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 200.w,
              ),
              child: CustomBlocBuilder<CreatePanVideoBloc>(
                buildForStates: const [PanMusicSelected],
                builder: (state) {
                  return Text(
                    state is PanMusicSelected ? state.music.title : 'Thêm nhạc',
                    style: textTheme.bodyMedium.withColor(
                      AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            8.swb,
          ],
        ),
      ),
    );
  }
}
