import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/custom_media_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoOverlay extends StatelessWidget {
  const VideoOverlay(this.state, {super.key});
  final CameraState state;

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
                // Empty sizebox to make record button center horizontally
                SizedBox.square(
                  dimension: 64.r,
                ),
                SizedBox.square(
                  dimension: 64.r,
                  child: AwesomeFlashButton(state: state),
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
                SizedBox.square(
                  dimension: 56.r,
                  child: StreamBuilder(
                    stream: state.captureState$,
                    builder: (_, snapshot) {
                      return CustomMediaPreview(
                        mediaCapture: snapshot.data,
                        onMediaTap: (MediaCapture mediaCapture) {},
                      );
                    },
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
