// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panvideo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanvideoResponse _$PanvideoResponseFromJson(Map<String, dynamic> json) =>
    PanvideoResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      videoUrl: json['videoUrl'] as String,
      thumbImageUrl: json['thumbImageUrl'] as String,
      durationInSecs: (json['durationInSecs'] as num).toInt(),
    );
