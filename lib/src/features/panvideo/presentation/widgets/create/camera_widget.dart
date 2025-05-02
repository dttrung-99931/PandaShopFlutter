// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/recording_time_progress.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/video_overlay.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/video_recording_overlay.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panda_map/widgets/loading_widget.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _Camera(),
        ),
        Positioned(
          bottom: 8.h,
          left: 16.w,
          right: 16.w,
          child: CustomBlocBuilder<CreatePanVideoBloc>(
            buildForStates: const [PanvideoRecordingStarted],
            builder: (state) {
              if (state is! PanvideoRecordingStarted) {
                return emptyWidget;
              }
              return SafeArea(
                child: RecordingTimeProgress(
                  durationInSecs: state.duration.durationInSecs,
                  onComplete: () {
                    createPanVideoBloc.add(OnCompletingRecording());
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Camera extends StatefulWidget {
  @override
  State<_Camera> createState() => _CameraState();
}

class _CameraState extends State<_Camera> {
  String? _recordedVideoPath;

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<CreatePanVideoBloc>(
      listener: (state) {
        if (state is PanvideoRecordingComplete) {
          _onVideoRecordComplete(state);
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: CameraAwesomeBuilder.custom(
              saveConfig: SaveConfig.video(
                videoOptions: VideoOptions(
                  quality: VideoRecordingQuality.highest,
                  android: AndroidVideoOptions(
                    fallbackStrategy: QualityFallbackStrategy.higher,
                  ),
                  enableAudio: true,
                ),
              ),
              filters: [
                AwesomeFilter.AddictiveBlue,
                AwesomeFilter.Amaro,
              ],
              sensorConfig: SensorConfig.single(
                aspectRatio: CameraAspectRatios.ratio_16_9,
              ),
              onMediaCaptureEvent: _onVideoCaptureEvent,
              progressIndicator: Container(
                constraints: const BoxConstraints.expand(),
                color: Colors.black,
                child: LoadingWidget(
                  size: 40.r,
                ),
              ),
              builder: (CameraState state, Preview preview) {
                return state.when(
                  onVideoMode: (VideoCameraState state) {
                    return VideoOverlay(state);
                  },
                  onVideoRecordingMode: (VideoRecordingCameraState state) {
                    return CustomBlocListener<CreatePanVideoBloc>(
                      listener: (blocState) async {
                        // TODO: move pause camerate logic to bloc for being clearly
                        if (blocState is PanvideoCompletingRecording) {
                          await state.stopRecording();
                          createPanVideoBloc.add(
                            OnRecordingComplete(
                              state.captureState!.captureRequest.path!,
                            ),
                          );
                        }
                      },
                      child: VideoRecordingOverlay(state),
                    );
                  },
                  // onPreviewMode: (PreviewCameraState state) {
                  //   return VideoPreviewOverlay(state);
                  // },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onVideoCaptureEvent(MediaCapture event) async {
    switch ((event.status, event.isVideo, event.videoState)) {
      case (MediaCaptureStatus.capturing, true, VideoState.started):
        if (event.isRecordingVideo) {
          createPanVideoBloc.add(OnStartRecording());
        }
        break;
      case (MediaCaptureStatus.capturing, true, VideoState.paused):
        createPanVideoBloc.add(OnPauseRecording());
        break;
      case (MediaCaptureStatus.capturing, true, VideoState.resumed):
        createPanVideoBloc.add(OnResumeRecording());
        break;
      // Complete video recording
      case (MediaCaptureStatus.success, true, VideoState.stopped):
        if (event.videoState == VideoState.stopped) {
          createPanVideoBloc.add(OnRecordingComplete(
            event.captureRequest.path!,
          ));
        }
      default:
    }
  }

  Future<void> _onVideoRecordComplete(PanvideoRecordingComplete state) async {
    if (CamerawesomePlugin.currentState == CameraRunningState.stopped) {
      return;
    }
    _recordedVideoPath = state.videoPath;
    Global.pushNamed(
      EditPanvideoScreen.router,
      args: EditPanvideoArgs(
        state.videoPath,
        music: createPanVideoBloc.selectedMusic,
      ),
    );
  }

  @override
  void dispose() {
    // Remove recorded video file
    if (_recordedVideoPath != null) {
      File(_recordedVideoPath!).delete();
    }
    super.dispose();
  }
}
