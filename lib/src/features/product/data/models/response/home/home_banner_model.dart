// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'home_banner_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeBannerModel {
  final String imageLink;
  final int avgColor;

  HomeBannerModel(
    this.imageLink,
    this.avgColor,
  );

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) => _$HomeBannerModelFromJson(json);
}
