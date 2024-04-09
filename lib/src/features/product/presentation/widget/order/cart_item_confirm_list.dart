// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/domain/dto/order/order_confirm_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemConfirmList extends StatelessWidget {
  const CartItemConfirmList({
    super.key,
    required this.orderConfirm,
  });
  final OrderConfirmDto orderConfirm;
  List<CartItemDto> get items => orderConfirm.items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) {
          CartItemDto item = items[index];
          return CartItem(item: item, mode: CartItemMode.order);
        },
      ),
    );
  }
}
