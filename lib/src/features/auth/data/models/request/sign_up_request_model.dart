// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;

  SignUpRequestModel({
    required this.name,
    required this.phone,
    this.email = 'example@gmail.com',
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
