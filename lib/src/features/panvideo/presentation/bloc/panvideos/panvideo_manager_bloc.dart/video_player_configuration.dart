import 'package:awesome_video_player/awesome_video_player.dart';

class VideoPlayerConfiguration {
  final BetterPlayerConfiguration baseConfiguration;
  final double voulume;

  VideoPlayerConfiguration({
    required this.baseConfiguration,
    this.voulume = 0.4,
  });

  VideoPlayerConfiguration copyWith({
    BetterPlayerConfiguration? baseConfiguration,
    double? voulume,
  }) {
    return VideoPlayerConfiguration(
      baseConfiguration: baseConfiguration ?? this.baseConfiguration,
      voulume: voulume ?? this.voulume,
    );
  }
}
