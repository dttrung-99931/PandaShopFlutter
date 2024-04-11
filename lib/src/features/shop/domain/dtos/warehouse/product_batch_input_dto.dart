// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/parse_utils.dart';
import 'package:evievm_app/core/utils/time_utils.dart';
import 'package:evievm_app/src/features/shop/data/models/request/warehouse/product_batch_request_model.dart';
import 'package:flutter/material.dart';

class ProductBatchInputDto {
  static int _idGen = 0;

  int? id;
  final int productId;
  final int productInventoryInputId;
  int? productOptionId;
  final TextEditingController numberController = TextEditingController();
  final DateTime manufactureDate = now.subtract(10.days);
  final DateTime? expireDate = now.add(100.days);
  final DateTime? arriveDate = now;

  ProductBatchInputDto({
    required this.productInventoryInputId,
    required this.productId,
    this.productOptionId,
    // TODO: imple input on UI
    // this.manufactureDate,
    // this.expireDate,
    // this.arriveDate,
  }) : id = _idGen--;

  ProductBatchRequestModel toRequestModel({required int warehouseInputId}) {
    return ProductBatchRequestModel(
      id: null,
      productOptionId: productOptionId!,
      warehouseInputId: warehouseInputId,
      number: parseInt(numberController.text),
      manufactureDate: manufactureDate,
      expireDate: expireDate!,
      arriveDate: arriveDate,
    );
  }

  ProductBatchInputDto copyWith({
    int? productId,
    int? productInventoryInputId,
    int? productOptionId,
    String? number,
    DateTime? manufactureDate,
    DateTime? expireDate,
    DateTime? arriveDate,
  }) {
    return ProductBatchInputDto(
      productId: productId ?? this.productId,
      productInventoryInputId: productInventoryInputId ?? this.productInventoryInputId,
      productOptionId: productOptionId ?? this.productOptionId,
      // manufactureDate: manufactureDate ?? this.manufactureDate,
      // expireDate: expireDate ?? this.expireDate,
      // arriveDate: arriveDate ?? this.arriveDate,
    );
  }
}
