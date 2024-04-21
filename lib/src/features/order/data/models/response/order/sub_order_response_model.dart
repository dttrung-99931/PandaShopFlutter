// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_detail_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/short_product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_order_response_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class SubOrderResponseModel {
  final int id;
  final DeliveryResponseModel delivery;
  final String? note;
  final List<SubOrderDetailResponseModel> subOrderDetails;

  SubOrderResponseModel({
    required this.id,
    required this.delivery,
    this.note,
    required this.subOrderDetails,
  });

  factory SubOrderResponseModel.fromJson(Map<String, dynamic> json) => _$SubOrderResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class SubOrderDetailResponseModel {
  final int id;
  final DateTime? createdAt;
  final double discountPercent;
  final double price;
  final int productNum;
  final ProductOptionModel productOption;
  final ShortProductModel product;

  SubOrderDetailResponseModel({
    required this.id,
    this.createdAt,
    required this.discountPercent,
    required this.price,
    required this.productNum,
    required this.productOption,
    required this.product,
  });

  factory SubOrderDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubOrderDetailResponseModelFromJson(json);
}
