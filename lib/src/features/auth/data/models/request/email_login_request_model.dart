import 'package:json_annotation/json_annotation.dart';
part 'email_login_request_model.g.dart';

@JsonSerializable()
class EmailLoginRequestModel {
  final String email;
  final String password;
  @JsonKey(name: 'user_type')
  final String userType;

  EmailLoginRequestModel({
    required this.email,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toJson() => _$EmailLoginRequestModelToJson(this);
}
