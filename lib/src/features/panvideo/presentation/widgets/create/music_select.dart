// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/panmusic/panmusic_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/panmusic_select_list.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicSelect extends StatefulWidget {
  const MusicSelect({
    super.key,
    required this.onSelectMusic,
    this.initSelectedMusic,
  });
  final Function(PanMusicDto music) onSelectMusic;
  final PanMusicDto? initSelectedMusic;

  @override
  State<MusicSelect> createState() => _MusicSelectState();
}

class _MusicSelectState extends State<MusicSelect> {
  PanMusicDto? _selectedMusic;

  @override
  void initState() {
    panMusicBloc.add(OnGetPanMusics());
    _selectedMusic = widget.initSelectedMusic;
    super.initState();
  }

  didWidgetUpdate(MusicSelect oldWidget) {
    if (oldWidget.initSelectedMusic != widget.initSelectedMusic) {
      _selectedMusic = widget.initSelectedMusic;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (panMusicPlayerBloc.playingMusic != null) {
      panMusicPlayerBloc.add(OnPausePanMusic(panMusicPlayerBloc.playingMusic!));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      color: Colors.black87,
      padding: EdgeInsets.only(top: 8.h),
      child: Column(
        children: [
          Expanded(
            child: CustomBlocBuilder<PanMusicBloc>(
              buildForStates: const [GetPanMusicsSuccess],
              loadingWidgetBuilder: () {
                final loading = PanMusicDto.loading();
                return PanMusicSelectList(
                  panMusics: 10.genList((_) => loading),
                  onSelectMusic: (_) {},
                  selectedMusic: _selectedMusic,
                );
              },
              builder: (state) {
                if (state is! GetPanMusicsSuccess) {
                  return emptyWidget;
                }

                return PanMusicSelectList(
                  panMusics: state.data,
                  selectedMusic: _selectedMusic,
                  onSelectMusic: (music) {
                    if (music != _selectedMusic) {
                      _selectedMusic = music;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
          CustomButton(
            title: 'Chọn',
            height: 40.h,
            backgroundColor: Colors.black26,
            elevation: 0,
            titleFontSize: 14.sp,
            onPressed: () {
              if (_selectedMusic != null) {
                widget.onSelectMusic(_selectedMusic!);
              }
              Navigator.pop(context);
            },
          ),
          8.shb,
        ],
      ),
    );
  }
}
