// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart/shopping_cart_dto.dart';

class OrderConfirmDto extends Equatable {
  final List<CartItemDto> items;

  const OrderConfirmDto({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}

extension ShoppingCartDtoExt on OrderConfirmDto {
  int get totalItems => items.length;
  double get shippingFee => 26000;
  double get subtotal => items.sumDouble((element) => element.productNum * element.product.price);
  double get vatPercents => 8;
  double get vatPrice => subtotal * (vatPercents / 100);
  double get totalPrice => subtotal + vatPrice + shippingFee;

  bool containProduct(int productOptionId) {
    return items.any((element) => element.prouductOption.id == productOptionId);
  }

  CartItemDto? getItem(int productOptionId) {
    return items.firstWhereOrNull((element) => element.prouductOption.id == productOptionId);
  }
}
