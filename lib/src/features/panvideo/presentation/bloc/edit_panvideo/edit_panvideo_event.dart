// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_panvideo_bloc.dart';

class OnInitPanvideoEdit extends BaseEvent {
  final String videoPath;
  final PanMusicDto? panMusic;
  OnInitPanvideoEdit(this.videoPath, {required this.panMusic});

  @override
  List<Object?> get props => [videoPath, panMusic];
}

class OnEditPanvideo extends BaseEventWithoutProps {}
