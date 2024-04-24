import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';

class OrderDetailDto {
  final int id;
  final DateTime? createdAt;
  final double discountPercent;
  final double price;
  final int productNum;
  final ProductOptionDto productOption;
  final ProductDto product;

  OrderDetailDto({
    required this.id,
    required this.createdAt,
    required this.discountPercent,
    required this.price,
    required this.productNum,
    required this.productOption,
    required this.product,
  });

  factory OrderDetailDto.fromModel(OrderDetailResponseModel model) {
    return OrderDetailDto(
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
