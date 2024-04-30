// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final T data;
  final bool success;
  final int statusCode;
  final String? message;

  BaseResponse(this.data, this.success, this.statusCode, this.message);

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginatedListResponse<T> extends BaseResponse<List<T>> {
  PaginatedListResponse(super.data, super.success, super.statusCode, super.message, this.pagination);

  @JsonKey(name: 'meta')
  final PaginationModel pagination;

  PaginatedList<T> toPaginiatedList() {
    return PaginatedList<T>(
      data: data,
      pageSize: pagination.pageSize,
      pageNum: pagination.pageNum,
      total: pagination.total,
    );
  }

  factory PaginatedListResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedListResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class PaginationModel {
  PaginationModel({
    required this.pageSize,
    required this.pageNum,
    required this.total,
  });
  final int pageSize;
  final int pageNum;
  final int total;

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
}
