import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/shopping_cart_dto.dart';

extension ShoppingCartDtoExt on ShoppingCartDto {
  double get totalPriceOfSelected => selected.sumDouble((element) => element.productNum * element.product.price);
  int get total => items.length;
  int get totalSelected => selected.length;
  List<CartItemDto> get selected => items.where((element) => element.isSelected).toList();

  bool containProduct(int productOptionId) {
    return items.any((element) => element.prouductOption.id == productOptionId);
  }

  CartItemDto? getItem(int productOptionId) {
    return items.firstWhereOrNull((element) => element.prouductOption.id == productOptionId);
  }
}
