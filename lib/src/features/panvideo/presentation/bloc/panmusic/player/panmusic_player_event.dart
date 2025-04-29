// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'panmusic_player_bloc.dart';

class OnGetPanMusics extends BaseEvent {
  final String? q;

  OnGetPanMusics({this.q});

  @override
  List<Object?> get props => [q];
}

class PanMusicEvent extends BaseEvent {
  final PanMusicDto music;

  PanMusicEvent(this.music);

  @override
  List<Object?> get props => [music];
}

class OnPlayPanMusic extends PanMusicEvent {
  OnPlayPanMusic(super.music);
}

class OnPausePanMusic extends PanMusicEvent {
  OnPausePanMusic(super.music);
}
