import 'dart:io';

import 'package:equatable/equatable.dart';

class EditPanvideoResultDto extends Equatable {
  final File? video;
  final String? description;
  final String title;
  final int durationInSecs;
  const EditPanvideoResultDto({
    required this.video,
    required this.description,
    required this.title,
    required this.durationInSecs,
  });

  @override
  List<Object?> get props => [video, description, title, durationInSecs];
}
