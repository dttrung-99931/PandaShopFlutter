// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_panvideo_bloc.dart';

class OnInitPanMusic extends BaseEvent {
  final PanMusicDto music;
  OnInitPanMusic(this.music
  );

  @override
  List<Object?> get props => [music];
}
