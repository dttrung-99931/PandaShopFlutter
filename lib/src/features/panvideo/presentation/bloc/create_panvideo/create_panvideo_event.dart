// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_panvideo_bloc.dart';

class OnCreatePanvideo extends BaseEvent {
  OnCreatePanvideo(
    this.video,
    this.description,
    this.title,
    this.durationInSecs,
  );
  final File video;
  final String? description;
  final String title;
  final int durationInSecs;

  @override
  List<Object?> get props => [
        title,
        video.path,
        description,
        durationInSecs,
      ];
}

class OnPanMusicSelected extends BaseEvent {
  final PanMusicDto music;
  OnPanMusicSelected(this.music);

  @override
  List<Object?> get props => [music];
}

class OnStartRecording extends BaseEvent {
  final PanvideoDuration duration;

  OnStartRecording({this.duration = PanvideoDuration.short});

  @override
  List<Object?> get props => [duration];
}

class OnRecordingComplete extends BaseEvent {
  final String videoPath;
  OnRecordingComplete(this.videoPath);

  @override
  List<Object?> get props => [videoPath];
}

class OnCompletingRecording extends BaseEventWithoutProps {}

class OnPauseRecording extends BaseEventWithoutProps {}

class OnResumeRecording extends BaseEventWithoutProps {}
