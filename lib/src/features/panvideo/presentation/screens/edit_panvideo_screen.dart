// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/create_panvideo_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_edit_actions.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_pause_player_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_timer.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_controller_builder.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPanvideoArgs {
  final String videoPath;

  EditPanvideoArgs(this.videoPath);
}

class EditPanvideoScreen extends StatefulWidget {
  static const router = '/editPanvideo';
  const EditPanvideoScreen(this.args, {super.key});
  final EditPanvideoArgs args;

  @override
  State<EditPanvideoScreen> createState() => _EditPanvideoScreenState();
}

class _EditPanvideoScreenState extends AutoResetBlocState<EditPanvideoScreen, PanvideoManagerBloc> {
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
          child: PanvideoControllerBuilder(
            onInitilized: (_) {
              panvideoManagerBloc
                ..add(
                  OnAddPanvideoDatasources(
                    datasources: [
                      VideoDatasource(BetterPlayerDataSourceType.file, widget.args.videoPath, thumbImageUrl: ''),
                    ],
                  ),
                )
                ..add(
                  OnLoadPanvideo(videoIndex: 0, direction: ScrollDirection.down, playAfterLoaded: true),
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
                    height: 36.h,
                    bottom: 40.h,
                    left: 0,
                    right: 0,
                    child: PanvideoProgressIndicator(
                      controller: controller,
                      playedColor: AppColors.primaryShop,
                    ),
                  ),
                  Positioned(
                    bottom: 16.h,
                    left: 4.w,
                    child: VideoTimer(controller: controller),
                  ),
                  VideoPlayPauseButton(controller: controller),
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
