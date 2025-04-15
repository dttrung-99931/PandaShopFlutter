import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panvideo_response.dart';

class PanvideoDto {
  PanvideoDto({
    required this.id,
    required this.videoUrl,
    required this.thumbImageUrl,
    required this.title,
    required this.description,
    required this.durationInSecs,
  });
  final int id;
  final String videoUrl;
  final String thumbImageUrl;
  final String title;
  final String description;
  final int durationInSecs;

  static PanvideoDto loading() {
    return PanvideoDto(
      id: Constants.idLoading,
      videoUrl: '',
      thumbImageUrl: '',
      title: '',
      description: '',
      durationInSecs: 0,
    );
  }

  factory PanvideoDto.fromModel(PanvideoResponse model) {
    return PanvideoDto(
      id: model.id,
      videoUrl: model.videoUrl,
      thumbImageUrl: model.thumbImageUrl,
      title: model.title,
      description: model.description,
      durationInSecs: model.durationInSecs,
    );
  }
}
