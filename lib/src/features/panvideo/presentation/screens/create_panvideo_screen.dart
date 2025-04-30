import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/panmusic/panmusic_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/create/music_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePanvideoScreen extends StatefulWidget {
  static const router = '/createPanvideo';

  const CreatePanvideoScreen({super.key});

  @override
  State<CreatePanvideoScreen> createState() => _CreatePanvideoScreenState();
}

class _CreatePanvideoScreenState extends AutoResetBlocState<CreatePanvideoScreen, CreatePanVideoBloc> {
  @override
  void onDisposeMoreBlocs() {
    getIt.resetLazySingleton<PanMusicBloc>();
    getIt.resetLazySingleton<PanMusicPlayerBloc>();
  }

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
