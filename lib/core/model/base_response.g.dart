// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      fromJsonT(json['data']),
      json['success'] as bool,
      (json['statusCode'] as num).toInt(),
      json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

PaginatedListResponse<T> _$PaginatedListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedListResponse<T>(
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      json['success'] as bool,
      (json['statusCode'] as num).toInt(),
      json['message'] as String?,
      PaginationModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      pageSize: (json['pageSize'] as num).toInt(),
      pageNum: (json['pageNum'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );
