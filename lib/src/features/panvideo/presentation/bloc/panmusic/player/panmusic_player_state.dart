// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'panmusic_player_bloc.dart';

class PanMusicState extends BaseState {
  PanMusicState(
    this.music,
  );
  final PanMusicDto music;

  @override
  List<Object?> get props => [music];
}

class PanMusicPlaying extends PanMusicState {
  PanMusicPlaying(super.music);
}

class PanMusicPaused extends PanMusicState {
  PanMusicPaused(super.music);
}

class PanMusicLoading extends PanMusicState {
  PanMusicLoading(super.music);
}

class PanMusicError extends ErrorState {
  PanMusicError(this.music, super.failure);
  final PanMusicDto music;
}
