// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evievm_app/core/utils/extensions/file_extension.dart';

class CreatePanvideoRequest {
  CreatePanvideoRequest({
    required this.video,
    required this.thumbnailImage,
    required this.description,
    required this.title,
    required this.durationInSecs,
  });
  final File video;
  final File thumbnailImage;
  final String? description;
  final String title;
  final int durationInSecs;

  Future<MultipartFile> getVideoMultipart() async {
    return MultipartFile.fromFile(
      video.path,
      filename: video.name,
    );
  }

  Future<MultipartFile> getThumbnailImageMultipart() async {
    return MultipartFile.fromFile(
      thumbnailImage.path,
      filename: thumbnailImage.name,
    );
  }
}
