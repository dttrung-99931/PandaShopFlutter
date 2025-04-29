// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/pan_music_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/panmusic/panmusic_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';

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
            return const MusicSelect();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note_outlined, color: AppColors.white, size: 24.r),
            8.swb,
            Text(
              'Thêm nhạc',
              style: textTheme.bodyMedium.withColor(
                AppColors.white,
              ),
            ),
            8.swb,
          ],
        ),
      ),
    );
  }
}

class MusicSelect extends StatefulWidget {
  const MusicSelect({
    super.key,
  });

  @override
  State<MusicSelect> createState() => _MusicSelectState();
}

class _MusicSelectState extends State<MusicSelect> {
  @override
  void initState() {
    panMusicBloc.add(OnGetPanMusics());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      color: Colors.black87,
      padding: EdgeInsets.only(top: 8.h),
      child: CustomBlocBuilder<PanMusicBloc>(
        buildForStates: const [GetPanMusicsSuccess],
        loadingWidgetBuilder: () {
          final loading = PanMusicDto.loading();
          return PanMusicSelectList(panMusics: 10.genList((_) => loading));
        },
        builder: (state) {
          if (state is! GetPanMusicsSuccess) {
            return emptyWidget;
          }

          return PanMusicSelectList(panMusics: state.data);
        },
      ),
    );
  }
}
