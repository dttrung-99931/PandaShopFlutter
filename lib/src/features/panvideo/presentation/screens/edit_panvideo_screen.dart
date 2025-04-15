// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/create_panvideo_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_edit_actions.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_pause_player_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_timer.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panda_map/widgets/loading_widget.dart';
import 'package:video_player/video_player.dart';

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

class _EditPanvideoScreenState extends State<EditPanvideoScreen> {
  late VideoPlayerController _controller;
  late OnCreatePanvideo _createVideoEvent;

  @override
  void initState() {
    super.initState();
    _initController();
    _createVideoEvent = OnCreatePanvideo(
      File(widget.args.videoPath),
      'Description $now',
      'Title $now',
      _controller.value.duration.inSeconds,
    );
  }

  void _initController() {
    _controller = VideoPlayerController.file(
      File(widget.args.videoPath),
    );
    _controller.initialize().then((_) {
      setState(() {}); // Refresh the UI once the video is initialized
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          child: !_controller.value.isInitialized
              ? const LoadingWidget()
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    Positioned(
                      height: 36.h,
                      bottom: 40.h,
                      left: 0,
                      right: 0,
                      child: PanvideoProgressIndicator(
                        controller: _controller,
                        playedColor: AppColors.primaryShop,
                      ),
                    ),
                    Positioned(
                      bottom: 16.h,
                      left: 4.w,
                      child: VideoTimer(controller: _controller),
                    ),
                    VideoPlayPauseButton(controller: _controller),
                  ],
                ),
        ),
        bottomNavigationBar: const VideoEditActions(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CreatePanvideoButton(_createVideoEvent),
      ),
    );
  }
}
