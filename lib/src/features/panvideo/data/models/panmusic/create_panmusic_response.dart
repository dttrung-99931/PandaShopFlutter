// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'create_panmusic_response.g.dart';

@JsonSerializable(createToJson: false)
class CreatePanMusicResponse {
  final int id;
  CreatePanMusicResponse({
    required this.id,
  });

  factory CreatePanMusicResponse.fromJson(Map<String, dynamic> json) => _$CreatePanMusicResponseFromJson(json);
}
