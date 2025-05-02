// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/edit_panvideo/edit_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/create_panvideo_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_edit_actions.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/panvideo_play_pause_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_timer.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_controller_builder.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPanvideoArgs {
  final String videoPath;
  final PanMusicDto? music;

  EditPanvideoArgs(this.videoPath, {this.music});
}

class EditPanvideoScreen extends StatefulWidget {
  static const router = '/editPanvideo';
  const EditPanvideoScreen(this.args, {super.key});
  final EditPanvideoArgs args;

  @override
  State<EditPanvideoScreen> createState() => _EditPanvideoScreenState();
}

class _EditPanvideoScreenState extends AutoResetBlocState<EditPanvideoScreen, EditPanVideoBloc> {
  late OnCreatePanvideo _createVideoEvent;

  @override
  void initState() {
    super.initState();
    _createVideoEvent = OnCreatePanvideo(
      File(widget.args.videoPath),
      'Description $now',
      'Title $now',
      100,
    );
    if (widget.args.music != null) {
      editPanVideoBloc.add(OnInitPanMusic(widget.args.music!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // camera overlay the status bar
      child: Scaffold(
        backgroundColor: AppColors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          leading: const BackButton(
            color: AppColors.white,
          ),
        ),
        body: SizedBox.expand(
          child: PanvideoControllerBuilder<EditPanVideoBloc>(
            onInitilized: (_) {
              editPanVideoBloc
                ..add(
                  OnAddPanvideoDatasources(
                    datasources: [
                      VideoDatasource(BetterPlayerDataSourceType.file, widget.args.videoPath, thumbImageUrl: ''),
                    ],
                  ),
                )
                ..add(
                  OnLoadPanvideo(videoIndex: 0, direction: ScrollDirection.down, playAfterLoaded: false),
                );
            },
            builder: (controller) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: BetterPlayer(controller: controller),
                  ),
                  Positioned(
                    bottom: 16.h,
                    left: 4.w,
                    child: VideoTimer(controller: controller),
                  ),
                  Positioned.fill(
                    child: PanvideoPlayPauseButton(controller: controller),
                  ),
                  Positioned(
                    height: 36.h,
                    bottom: 116.h,
                    left: 0,
                    right: 0,
                    child: PanvideoProgressIndicator(
                      controller: controller,
                      playedColor: AppColors.primaryShop,
                      alwaysShowProgressBar: true,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: const VideoEditActions(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CreatePanvideoButton(_createVideoEvent),
      ),
    );
  }
}
