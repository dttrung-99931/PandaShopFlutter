import 'package:json_annotation/json_annotation.dart';

part 'panmusic_response.g.dart';

@JsonSerializable(createToJson: false)
class PanMusicResponse {
  final int id;
  final String title;
  final String musicUrl;
  final int durationInSecs;

  PanMusicResponse({
    required this.id,
    required this.title,
    required this.musicUrl,
    required this.durationInSecs,
  });

  factory PanMusicResponse.fromJson(Map<String, dynamic> json) => _$PanMusicResponseFromJson(json);
}
