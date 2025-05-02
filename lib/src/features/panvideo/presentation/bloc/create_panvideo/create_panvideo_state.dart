part of 'create_panvideo_bloc.dart';

class CreatePanvideoSuccess extends FullDataLoadedState<CreatePanvideoResponseDto> {
  CreatePanvideoSuccess(super.data);
}

class PanMusicSelected extends BaseState {
  final PanMusicDto music;
  PanMusicSelected(this.music);

  @override
  List<Object?> get props => [music];
}

class PanvideoRecordingStarted extends BaseState {
  final PanvideoDuration duration;
  PanvideoRecordingStarted(this.duration);

  @override
  List<Object?> get props => [duration];
}

class PanvideoRecordingPaused extends BaseStateWithoutProps {}

class PanvideoRecordingResumed extends BaseStateWithoutProps {}

class PanvideoRecordingComplete extends BaseState {
  final String videoPath;
  PanvideoRecordingComplete(this.videoPath);

  @override
  List<Object?> get props => [videoPath];
}

class PanvideoCompletingRecording extends BaseStateWithoutProps {}
