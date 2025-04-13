import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoRecordingOverlay extends StatelessWidget {
  const VideoRecordingOverlay(this.state, {super.key});
  final VideoRecordingCameraState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 24.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              spacing: 32.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 64.r,
                  child: AwesomeFlashButton(state: state),
                ),
                SizedBox.square(
                  dimension: 64.r,
                  child: AwesomePauseResumeButton(
                    state: state,
                    theme: AwesomeTheme(
                      buttonTheme: AwesomeButtonTheme(iconSize: 24.r, padding: EdgeInsets.zero),
                    ),
                  ),
                ),
                SizedBox.square(
                  dimension: 80.r,
                  child: AwesomeCaptureButton(state: state),
                ),
                SizedBox.square(
                  dimension: 64.r,
                  child: AwesomeCameraSwitchButton(
                    state: state,
                    scale: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
