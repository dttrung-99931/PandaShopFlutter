// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';

class UserDetailDto {
  UserDetailDto({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.cartId,
    required this.shop,
  });
  final String name;
  final String phone;
  final String email;
  final String password;
  final int cartId;
  final ShopResponseDto? shop;

  factory UserDetailDto.fromModel(UserDetailModel model) {
    return UserDetailDto(
      name: model.name,
      phone: model.phone,
      email: model.email,
      password: model.password,
      cartId: model.cartId,
      shop: model.shop != null ? ShopResponseDto.fromModel(model.shop!) : null,
    );
  }
}
