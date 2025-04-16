// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'panvideo_manager_bloc.dart';

class OnGetVideoController extends BaseEvent {
  OnGetVideoController({
    required this.videoIndex,
    required this.direction,
  });

  final int videoIndex;
  final ScrollDirection direction;

  @override
  List<Object?> get props => [videoIndex, direction];
}

class OnPreloadPanvideo extends BaseEvent {
  OnPreloadPanvideo({
    required this.curVideoIndex,
    required this.direction,
  });

  final int curVideoIndex;
  final ScrollDirection direction;

  @override
  List<Object?> get props => [curVideoIndex, direction];
}

class OnPanvideosAdded extends BaseEvent {
  OnPanvideosAdded({
    required this.panvideos,
  });
  final List<PanvideoDto> panvideos;

  @override
  List<Object?> get props => [panvideos];
}

class OnPlayPanvideo extends BaseEvent {
  final int videoIndex;
  OnPlayPanvideo({
    required this.videoIndex,
  });

  @override
  List<Object?> get props => [videoIndex];
}

class OnPausePanvideo extends BaseEvent {
  final int videoIndex;
  OnPausePanvideo({
    required this.videoIndex,
  });

  @override
  List<Object?> get props => [videoIndex];
}
