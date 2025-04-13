import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class VideoPreviewOverlay extends StatelessWidget {
  const VideoPreviewOverlay(this.state, {super.key});
  final CameraState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AwesomeCameraPreview(
            state: state,
            interfaceBuilder: (CameraState state, Preview preview) {
              return const SizedBox();
            },
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
          ),
        ),
        // Positioned.fill(
        //   bottom: 24.h,
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Row(
        //       spacing: 32.w,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SizedBox.square(
        //           dimension: 64.r,
        //           child: AwesomeFlashButton(state: state),
        //         ),
        //         SizedBox.square(
        //           dimension: 80.r,
        //           child: AwesomeCaptureButton(state: state),
        //         ),
        //         SizedBox.square(
        //           dimension: 64.r,
        //           child: AwesomeCameraSwitchButton(
        //             state: state,
        //             scale: 1,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
