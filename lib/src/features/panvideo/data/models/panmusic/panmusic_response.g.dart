// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panmusic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanMusicResponse _$PanMusicResponseFromJson(Map<String, dynamic> json) =>
    PanMusicResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      musicUrl: json['musicUrl'] as String,
      durationInSecs: (json['durationInSecs'] as num).toInt(),
    );
