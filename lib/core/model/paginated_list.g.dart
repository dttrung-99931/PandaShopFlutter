// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedList<T> _$PaginatedListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedList<T>(
      data:
          (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
      lastPage: json['last_page'] as int?,
      currentPage: json['current_page'] as int? ?? 0,
      to: json['to'] as int?,
      from: json['from'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PaginatedListToJson<T>(
  PaginatedList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'last_page': instance.lastPage,
      'current_page': instance.currentPage,
      'to': instance.to,
      'from': instance.from,
      'per_page': instance.perPage,
      'total': instance.total,
    };
