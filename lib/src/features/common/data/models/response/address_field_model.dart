// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'address_field_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressFieldModel {
  final String name;
  final String code;
  @JsonKey(name: 'name_with_type')
  final String path;

  AddressFieldModel(
    this.name,
    this.code,
    this.path,
  );

  factory AddressFieldModel.fromJson(Map<String, dynamic> json) => _$AddressFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressFieldModelToJson(this);
}
