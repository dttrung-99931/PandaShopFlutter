// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';

class ShopOrderSliverList extends StatelessWidget {
  const ShopOrderSliverList({
    super.key,
    required this.orders,
  });
  final List<OrderDto> orders;
  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const EmptyData(title: 'Chưa có đơn hàng', isSliver: true);
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: orders.length,
        (context, index) {
          OrderDto order = orders[index];
          return ShopOrderItem(order: order);
        },
      ),
    );
  }
}
