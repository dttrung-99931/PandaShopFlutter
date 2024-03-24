import 'package:evievm_app/src/features/auth/data/models/response/login_response_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';

class LoginResponseDto {
  final String accessToken;
  final ShopResponseDto? shop;

  LoginResponseDto({
    required this.accessToken,
    required this.shop,
  });

  factory LoginResponseDto.fromModel(LoginResponseModel model) {
    return LoginResponseDto(
      accessToken: model.token,
      shop: model.shop != null ? ShopResponseDto.fromModel(model.shop!) : null,
    );
  }
}
