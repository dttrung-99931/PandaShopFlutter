// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';

class OrderConfirmDto extends Equatable {
  final List<CartItemDto> items;

  const OrderConfirmDto({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}

extension ShoppingCartDtoExt on OrderConfirmDto {
  double get totalPrice => items.sumDouble((element) => element.productNum * element.product.price);
  int get total => items.length;

  bool containProduct(int productOptionId) {
    return items.any((element) => element.prouductOption.id == productOptionId);
  }

  CartItemDto? getItem(int productOptionId) {
    return items.firstWhereOrNull((element) => element.prouductOption.id == productOptionId);
  }
}
