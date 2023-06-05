import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';

class LoginResponseDto {
  final String accessToken;

  LoginResponseDto({required this.accessToken});

  factory LoginResponseDto.fromModel(LoginResponseModel model) {
    return LoginResponseDto(accessToken: model.accessToken);
  }
}
