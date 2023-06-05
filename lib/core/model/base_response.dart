import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final T data;
  final int? success;
  final String? message;
  final Map<String, dynamic>? errors; // structure ex: { "password": [ "パスワードは必須です"] }

  BaseResponse(this.data, this.success, this.message, this.errors);

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseToJson(this, toJsonT);

  bool get isSuccess => success == 1;
}
