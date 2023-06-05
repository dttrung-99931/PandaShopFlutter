import 'package:json_annotation/json_annotation.dart';

part 'user_profile_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserProfileRequestModel {
  @JsonKey(name: 'pass_chosse_manufacture')
  final bool? passChooseManufacturer;

  UserProfileRequestModel({
    this.passChooseManufacturer,
  });

  Map<String, dynamic> toJson() => _$UserProfileRequestModelToJson(this);
}
