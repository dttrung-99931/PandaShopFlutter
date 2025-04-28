import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/main/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/my_panvideo/my_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/panvideo_editor.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/video_overlay.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/video_recording_overlay.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panda_map/widgets/loading_widget.dart';

class CreatePanvideoScreen extends StatefulWidget {
  static const router = '/createPanvideo';

  const CreatePanvideoScreen({super.key});

  @override
  State<CreatePanvideoScreen> createState() => _CreatePanvideoScreenState();
}

class _CreatePanvideoScreenState extends State<CreatePanvideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // camera overlay the status bar
      child: Scaffold(
        body: CustomBlocListener<CreatePanVideoBloc>(
          listener: (state) {
            switch (state) {
              case (CreatePanvideoSuccess _):
                myPanVideoBloc.add(OnGetMyPanvideos());
                Global.popUntilNamed(MainScreen.router);
                showSnackBar('Tải lên thành công');
                break;

              case (EditingPanvideo editting):
                if (![CameraRunningState.stopped, CameraRunningState.stopping]
                    .contains(CamerawesomePlugin.currentState)) {
                  CamerawesomePlugin.stop();
                }
                break;

              case (EditPanvideoSuccess editSuccess):
                if (editSuccess.panvideo == null) {
                  if (![CameraRunningState.started, CameraRunningState.starting]
                      .contains(CamerawesomePlugin.currentState)) {
                    CamerawesomePlugin.start();
                  }
                  break;
                }
                createPanVideoBloc.add(OnCreatePanvideo(editSuccess.panvideo!));
                break;

              default:
            }
          },
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
                  return VideoRecordingOverlay(state);
                },
                // onPreviewMode: (PreviewCameraState state) {
                //   return VideoPreviewOverlay(state);
                // },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onVideoCaptureEvent(MediaCapture event) async {
    switch ((event.status, event.isPicture, event.isVideo)) {
      case (MediaCaptureStatus.capturing, false, true):
      // Recording video
      case (MediaCaptureStatus.success, false, true):
        if (event.videoState == VideoState.stopped) {
          await _onVideoRecordComplete(event);
        }
      default:
    }
  }

  Future<void> _onVideoRecordComplete(MediaCapture event) async {
    // Check to ignore callback called twice
    if (CamerawesomePlugin.currentState == CameraRunningState.stopped) {
      return;
    }
    createPanVideoBloc.add(
      OnEditPanvideo(EditPanvideoArgs(event.captureRequest.path!)),
    );
  }
}
