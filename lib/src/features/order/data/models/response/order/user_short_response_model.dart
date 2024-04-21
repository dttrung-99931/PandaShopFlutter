// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_short_response_model.g.dart';

@JsonSerializable(createToJson: false)
class UserShortResponseModel {
  final String name;
  final String email;
  final String phone;

  UserShortResponseModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserShortResponseModel.fromJson(Map<String, dynamic> json) => _$UserShortResponseModelFromJson(json);
}
