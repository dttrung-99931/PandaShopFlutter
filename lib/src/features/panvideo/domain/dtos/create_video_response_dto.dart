import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_response.dart';

class CreatePanvideoResponseDto {
  final int id;

  CreatePanvideoResponseDto({
    required this.id,
  });

  factory CreatePanvideoResponseDto.fromModel(CreatePanvideoResponse domain) {
    return CreatePanvideoResponseDto(
      id: domain.id,
    );
  }
}
