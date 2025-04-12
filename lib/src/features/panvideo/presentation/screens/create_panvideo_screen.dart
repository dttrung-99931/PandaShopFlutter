import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.video(
            videoOptions: VideoOptions(
              quality: VideoRecordingQuality.fhd,
              android: AndroidVideoOptions(
                fallbackStrategy: QualityFallbackStrategy.higher,
              ),
              enableAudio: true,
            ),
          ),
          onMediaCaptureEvent: (MediaCapture event) {
            switch ((event.status, event.isPicture, event.isVideo)) {
              case (MediaCaptureStatus.capturing, false, true):
              // Recording video
              case (MediaCaptureStatus.success, false, true):
              // Record done

              default:
            }
          },
        ),
      ),
    );
  }
}
