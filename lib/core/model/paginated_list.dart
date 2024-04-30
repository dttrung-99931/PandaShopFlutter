// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:evievm_app/core/model/base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedList<T> {
  final List<T> data;
  final int pageSize;
  final int pageNum;
  final int total;

  PaginatedList({
    required this.data,
    required this.pageSize,
    required this.pageNum,
    required this.total,
  });

  PaginatedList<U> mapList<U>(U Function(T value) map) {
    return PaginatedList<U>(
      data: data.map(map).toList(),
      pageNum: pageNum,
      pageSize: pageSize,
      total: total,
    );
  }

  bool get isEmpty => data.isEmpty;

  bool get isNotEmpty => data.isNotEmpty;
}
