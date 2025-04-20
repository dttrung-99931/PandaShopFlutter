// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'panvideo_manager_bloc.dart';

class OnInitVideoController extends BaseEvent {
  final double aspectRatio;
  OnInitVideoController({
    required this.aspectRatio,
  });

  @override
  List<Object?> get props => [aspectRatio];
}

class OnLoadPanvideo extends BaseEvent {
  OnLoadPanvideo({
    required this.videoIndex,
    required this.direction,
    required this.playAfterLoaded,
  });

  final int videoIndex;
  final ScrollDirection direction;
  final bool playAfterLoaded;

  @override
  List<Object?> get props => [playAfterLoaded, videoIndex, direction];
}

class OnPreloadPanvideo extends BaseEvent {
  OnPreloadPanvideo({
    required this.videoIndex,
    required this.direction,
  });

  final int videoIndex;
  final ScrollDirection direction;

  @override
  List<Object?> get props => [videoIndex, direction];
}

class VideoDatasource extends BetterPlayerDataSource {
  final String thumbImageUrl;

  VideoDatasource(
    super.type,
    super.source, {
    required this.thumbImageUrl,
    super.cacheConfiguration,
    super.bufferingConfiguration,
    super.videoFormat,
  });

  List<Object?> get props => [type, super.url, thumbImageUrl];
}

class OnAddPanvideoDatasources extends BaseEvent {
  OnAddPanvideoDatasources({
    required this.datasources,
  });
  final List<VideoDatasource> datasources;

  @override
  List<Object?> get props => [datasources.mapList((e) => e.props)];
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
