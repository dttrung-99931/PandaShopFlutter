import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_controller_builder.dart';
import 'package:flutter/material.dart';

class MiniVideoPlayer extends StatefulWidget {
  final String filePath;

  const MiniVideoPlayer({super.key, required this.filePath});

  @override
  State<StatefulWidget> createState() {
    return _MiniVideoPlayer();
  }
}

class _MiniVideoPlayer extends State<MiniVideoPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PanvideoControllerBuilder(
      builder: (controller) {
        return BetterPlayer(controller: controller);
      },
    );
  }
}
