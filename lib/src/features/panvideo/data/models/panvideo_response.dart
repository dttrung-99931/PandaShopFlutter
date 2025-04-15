// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'panvideo_response.g.dart';

@JsonSerializable(createToJson: false)
class PanvideoResponse {
  PanvideoResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumbImageUrl,
    required this.durationInSecs,
  });

  final int id;
  final String videoUrl;
  final String thumbImageUrl;
  final String title;
  final String description;
  final int durationInSecs;

  factory PanvideoResponse.fromJson(Map<String, dynamic> json) => _$PanvideoResponseFromJson(json);
}
