// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/user_short_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class UserShortDto {
  final String name;
  final String email;
  final String phone;

  UserShortDto({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserShortDto.fromModel(UserShortResponseModel model) {
    return UserShortDto(
      name: model.name,
      email: model.email,
      phone: model.phone,
    );
  }
}
