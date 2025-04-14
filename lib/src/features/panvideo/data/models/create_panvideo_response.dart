// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'create_panvideo_response.g.dart';

@JsonSerializable(createToJson: false)
class CreatePanvideoResponse {
  final int id;
  CreatePanvideoResponse({
    required this.id,
  });

  factory CreatePanvideoResponse.fromJson(Map<String, dynamic> json) => _$CreatePanvideoResponseFromJson(json);
}
