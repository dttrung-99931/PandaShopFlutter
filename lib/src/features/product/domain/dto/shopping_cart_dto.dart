// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';

class ShoppingCartDto {
  final int id;
  final List<CartItemDto> items;
  ShoppingCartDto({
    required this.id,
    required this.items,
  });
  factory ShoppingCartDto.fromModel(ShoppingCartModel model) {
    return ShoppingCartDto(id: model.id, items: model.items.mapList((element) => CartItemDto.fromModel(element)));
  }
}

class CartItemDto {
  final int productNum;
  final int proudctOptionId;
  final ProductDto product;
  final int id;

  CartItemDto({
    required this.productNum,
    required this.proudctOptionId,
    required this.product,
    required this.id,
  });

  factory CartItemDto.fromModel(CartItemModel model) {
    return CartItemDto(
      productNum: model.productNum,
      proudctOptionId: model.productOptionId,
      product: ProductDto.fromModel(model.shortProduct),
      id: model.id,
    );
  }
}
