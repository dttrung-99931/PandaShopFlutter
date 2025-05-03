// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/edit_panvideo/edit_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/create_panvideo_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/edit_panvideo_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/panvideo_play_pause_button.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_edit_actions.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/edit_video/video_timer.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_controller_builder.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_progress_indicator.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPanvideoScreenArgs {
  final String videoPath;
  final PanMusicDto? music;

  EditPanvideoScreenArgs(this.videoPath, {this.music});
}

class EditPanvideoScreen extends StatefulWidget {
  static const router = '/editPanvideo';
  const EditPanvideoScreen(this.args, {super.key});
  final EditPanvideoScreenArgs args;

  @override
  State<EditPanvideoScreen> createState() => _EditPanvideoScreenState();
}

class _EditPanvideoScreenState extends AutoResetBlocState<EditPanvideoScreen, EditPanVideoBloc> {
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
              editPanVideoBloc.add(
                OnInitPanvideoEdit(
                  widget.args.videoPath,
                  panMusic: widget.args.music,
                ),
              );
            },
            builder: (controller) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: BetterPlayer(controller: controller),
                  ),
                  Positioned.fill(
                    child: PanvideoPlayPauseButton(controller: controller),
                  ),
                  Positioned(
                    bottom: 38.h,
                    left: 4.w,
                    child: VideoTimer(controller: controller),
                  ),
                  Positioned(
                    bottom: 32.h,
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
        bottomNavigationBar: CustomBlocBuilder<EditPanVideoBloc>(
          buildForStates: const [EditPanvideoSuccess],
          handleLoading: false,
          builder: (state) {
            return VideoEditActions(
              isVisibility: state is! EditPanvideoSuccess,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomBlocBuilder<EditPanVideoBloc>(
          buildForStates: const [EditPanvideoSuccess],
          handleLoading: false,
          builder: (state) {
            if (state is EditPanvideoSuccess) {
              return CreatePanvideoButton(
                OnCreatePanvideo(
                  state.editedVideo,
                  'Description $now', // TODO: edit desc, title
                  'Title $now',
                  100,
                ),
              );
            }
            return const EditPanvideoButton();
          },
        ),
      ),
    );
  }
}
