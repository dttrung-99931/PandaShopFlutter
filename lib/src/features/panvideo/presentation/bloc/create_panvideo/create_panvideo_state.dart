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
