// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      json['title'] as String,
      json['description'] as String,
      $enumDecode(_$NotificationTypeEnumMap, json['type']),
      NotificationDataModel.fromJson(json['data'] as Map<String, dynamic>),
      DateTime.parse(json['createdDate'] as String),
    );

const _$NotificationTypeEnumMap = {
  NotificationType.order: 1,
  NotificationType.ads: 4,
};
