// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/shop_order_sliver_list.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/waiting_delivering_order_group_sliver_list.dart';
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
        switch (state.orderStatus) {
          case OrderStatus.created:
          case OrderStatus.pending:
          case OrderStatus.processing:
          case OrderStatus.cancelledByBuyer:
          case OrderStatus.cancelledByShop:
          case OrderStatus.delivering:
          case OrderStatus.delivered:
          case OrderStatus.completedByUser:
          case OrderStatus.completedBySystem:
          case OrderStatus.lost:
            return ShopOrderSliverList(orders: state.data);
          case OrderStatus.completeProcessing:
          case OrderStatus.waitingForDelivering:
            return WaitingDeliveringOrderGroupSliverList(
              deliveringOrdersByPartnerAddr: state.ordersGroupByDeliveryPartnerAddr.entries.toList(),
            );
        }
      },
    );
  }
}
