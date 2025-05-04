// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evievm_app/core/utils/extensions/file_extension.dart';

class CreatePanMusicRequest {
  CreatePanMusicRequest({
    required this.music,
    required this.title,
    required this.durationInSecs,
  });
  final File music;
  final String title;
  final int durationInSecs;

  Future<MultipartFile> getMusicMultipart() async {
    return MultipartFile.fromFile(
      music.path,
      filename: music.name,
    );
  }
}
