// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_edit_actions.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
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
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = VideoPlayerController.file(
      File(widget.args.videoPath),
    );
    _controller.initialize().then((_) {
      setState(() {}); // Refresh the UI once the video is initialized
    });
    _controller.addListener(_videoPlayListener);
  }

  void _videoPlayListener() {
    if (_controller.value.isPlaying != _isPlaying) {
      _isPlaying = _controller.value.isPlaying;
      setState(() {});
    }
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (!_controller.value.isInitialized) {
      body = const LoadingWidget();
    } else {
      body = Stack(
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
            bottom: 20.h,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              colors: const VideoProgressColors(
                playedColor: AppColors.primaryShop,
              ),
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            onPressed: _togglePlayPause,
            backgroundColor: Colors.white38,
            shape: const CircleBorder(),
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: AppColors.black,
              size: (_isPlaying ? 44 : 48).r,
            ),
          ),
        ],
      );
    }
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
        body: SizedBox.expand(child: body),
        bottomNavigationBar: const VideoEditActions(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _CreatePanvideoButton(File(widget.args.videoPath)),
      ),
    );
  }
}

class _CreatePanvideoButton extends StatefulWidget {
  const _CreatePanvideoButton(this.video);
  final File video;
  @override
  State<_CreatePanvideoButton> createState() => _CreatePanvideoButtonState();
}

class _CreatePanvideoButtonState extends State<_CreatePanvideoButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 8.h),
      child: SizedBox.square(
        dimension: 64.r,
        child: CustomBlocConsumer<CreatePanVideoBloc>(
          handleLoading: false,
          listener: (state) {
            switch (state) {
              case (LoadingState _):
                _animationController.repeat();
              case (CreatePanvideoSuccess _):
                _animationController.stop();
                showSnackBar('Upload completed');
              default:
                _animationController.stop();
            }
          },
          builder: (state) => Stack(
            alignment: Alignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: _createPanvideo,
                shape: const CircleBorder(),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationController.value * 2 * 3.141592653589793,
                      child: Icon(
                        Icons.upload_outlined,
                        size: 48.r,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              // if (state is LoadingState)
              //   const Positioned.fill(
              //     child: CircularProgressIndicator(
              //       value: 0.6,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  void _createPanvideo() {
    createPanVideoBloc.add(
      OnCreatePanvideo(
        widget.video,
        'Video description $now',
        'Title $now',
        1000,
      ),
    );
  }
}
