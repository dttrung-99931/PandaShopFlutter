import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/panmusic_response.dart';

class PanMusicDto extends Equatable {
  const PanMusicDto({
    required this.id,
    required this.musicUrl,
    required this.title,
    required this.durationInSecs,
  });
  final int id;
  final String musicUrl;
  final String title;
  final int durationInSecs;

  static PanMusicDto loading() {
    return const PanMusicDto(
      id: Constants.idLoading,
      musicUrl: '',
      title: '',
      durationInSecs: 0,
    );
  }

  factory PanMusicDto.fromModel(PanMusicResponse model) {
    return PanMusicDto(
      id: model.id,
      musicUrl: model.musicUrl,
      title: model.title,
      durationInSecs: model.durationInSecs,
    );
  }

  @override
  List<Object?> get props => [id];
}
