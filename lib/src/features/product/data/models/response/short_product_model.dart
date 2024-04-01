import 'package:json_annotation/json_annotation.dart';

part 'short_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShortProductModel {
  final int id;
  final String name;
  final double firstPrice;
  final String? thumbImgLink;
  final String? sentFrom;
  final int sellingNum;
  final int remainingNum;
  final double starNum;

  ShortProductModel(this.id, this.name, this.firstPrice, this.thumbImgLink, this.sentFrom, this.sellingNum,
      this.remainingNum, this.starNum);

  factory ShortProductModel.fromJson(Map<String, dynamic> json) => _$ShortProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShortProductModelToJson(this);
}
