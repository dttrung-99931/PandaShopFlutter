// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';

class ShopOrderListBuilder extends StatelessWidget {
  const ShopOrderListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopOrderBloc>(
      isSliver: true,
      buildForStates: const [GetShopOrdersSuccess],
      builder: (state) {
        if (state is! GetShopOrdersSuccess) {
          return const SliverSizedBox();
        }
        if (state.data.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Đơn hàng trống!', style: textTheme.bodyMedium)),
          );
        }
        return ShopOrderSliverList(orders: state.data);
      },
    );
  }
}

class ShopOrderSliverList extends StatelessWidget {
  const ShopOrderSliverList({
    Key? key,
    required this.orders,
  }) : super(key: key);
  final List<OrderDto> orders;
  @override
  Widget build(BuildContext context) {
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
