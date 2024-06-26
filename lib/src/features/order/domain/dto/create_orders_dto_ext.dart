part of 'create_orders_dto.dart';

extension CreateOrderDtoExt on CreateOrdersDto {
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
