// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'panvideo_manager_bloc.dart';

class GetVideoControllerSuccess extends BaseState {
  GetVideoControllerSuccess({
    required this.controller,
    required this.videoIndex,
  });
  final BetterPlayerController controller;
  final int videoIndex;

  @override
  List<Object?> get props => [controller.hashCode, videoIndex];
}

class InitVideoControllerSuccess extends BaseState {
  InitVideoControllerSuccess({
    required this.controller,
  });
  final BetterPlayerController controller;

  @override
  List<Object?> get props => [controller.hashCode];
}

abstract class PanvideoStatusState extends BaseState {
  final int videoIndex;
  PanvideoStatusState({
    required this.videoIndex,
  });
  @override
  List<Object?> get props => [videoIndex];
}

class PanvideoPlaying extends PanvideoStatusState {
  PanvideoPlaying({required super.videoIndex});
}

class PanvideoPlayed extends PanvideoStatusState {
  PanvideoPlayed({required super.videoIndex});
}
