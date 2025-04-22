import 'package:awesome_video_player/awesome_video_player.dart';

extension BetterPlayerControllerExtension on BetterPlayerController {
  bool get isPlayingSaffe => hasCurrentDataSourceStarted && isPlaying() == true;
}
