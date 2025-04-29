import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/camera_widget.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/music_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePanvideoScreen extends StatelessWidget {
  static const router = '/createPanvideo';

  const CreatePanvideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // camera overlay the status bar
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            // const Positioned.fill(child: CameraWidget()),
            Positioned(
              top: 64.h,
              child: const MusicButton(),
            ),
          ],
        ),
      ),
    );
  }
}
