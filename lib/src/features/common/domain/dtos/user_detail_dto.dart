// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/user/user_detail_model.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';

class UserDetailDto {
  UserDetailDto({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.cartId,
    required this.shop,
  });
  final int id;
  final String name;
  final String phone;
  final String email;
  final int cartId;
  final ShopDto? shop;

  factory UserDetailDto.fromModel(UserDetailModel model) {
    return UserDetailDto(
      id: model.id,
      name: model.name,
      phone: model.phone,
      email: model.email,
      cartId: model.cartId,
      shop: model.shop != null ? ShopDto.fromModel(model.shop!) : null,
    );
  }
}
