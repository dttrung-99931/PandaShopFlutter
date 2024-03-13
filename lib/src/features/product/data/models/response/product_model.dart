import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShortProductModel {
  final int id;
  final String name;
  final double firstPrice;
  final String thumbImgLink;
  final String sentFrom;
  final int sellingNum;
  final int remainingNum;
  final double starNum;

  ShortProductModel(this.id, this.name, this.firstPrice, this.thumbImgLink, this.sentFrom, this.sellingNum,
      this.remainingNum, this.starNum);

  factory ShortProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
