// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/sub_order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';

class SubOrderDto {
  final int id;
  final DeliveryDto delivery;
  final String? note;
  final List<SubOrderDetailDto> subOrderDetails;

  SubOrderDto({
    required this.id,
    required this.delivery,
    required this.note,
    required this.subOrderDetails,
  });

  factory SubOrderDto.fromModel(SubOrderResponseModel model) {
    return SubOrderDto(
      id: model.id,
      delivery: DeliveryDto.fromModel(model.delivery),
      note: model.note,
      subOrderDetails: model.subOrderDetails.mapList((element) => SubOrderDetailDto.fromModel(element)),
    );
  }
}

class SubOrderDetailDto {
  final int id;
  final DateTime? createdAt;
  final double discountPercent;
  final double price;
  final int productNum;
  final ProductOptionDto productOption;
  final ProductDto product;

  SubOrderDetailDto({
    required this.id,
    required this.createdAt,
    required this.discountPercent,
    required this.price,
    required this.productNum,
    required this.productOption,
    required this.product,
  });

  factory SubOrderDetailDto.fromModel(SubOrderDetailResponseModel model) {
    return SubOrderDetailDto(
      id: model.id,
      discountPercent: model.discountPercent,
      createdAt: model.createdAt,
      price: model.price,
      productNum: model.productNum,
      productOption: ProductOptionDto.fromModel(model.productOption),
      product: ProductDto.fromModel(model.product),
    );
  }
}
