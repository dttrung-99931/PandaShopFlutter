// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sub_order_request_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true, createFactory: false)
class SubOrderRequestModel {
  final int? id;
  final int addressId;
  final int deliveryMethodId;
  final List<SubOrderDetailRequestModel> subOrderDetails;
  SubOrderRequestModel({
    required this.id,
    required this.addressId,
    required this.deliveryMethodId,
    required this.subOrderDetails,
  });

  Map<String, dynamic> toJson() => _$SubOrderRequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false, createFactory: false)
class SubOrderDetailRequestModel {
  final int? id;
  final int productOptionId;
  final double discountPercent;
  final double price;
  final int productNum;
  SubOrderDetailRequestModel({
    required this.id,
    required this.productOptionId,
    required this.discountPercent,
    required this.price,
    required this.productNum,
  });

  Map<String, dynamic> toJson() => _$SubOrderDetailRequestModelToJson(this);
}
