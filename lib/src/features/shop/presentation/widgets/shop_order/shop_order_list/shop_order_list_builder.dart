// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/complete_processing_orders_slv_list.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/delivering_orders_slv_list.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/shop_order_sliver_list.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/waiting_delivery_partner_orders_slv_list.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';

class ShopOrderListBuilder extends StatelessWidget {
  const ShopOrderListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopOrderBloc>(
      isSliver: true,
      buildForStates: const [
        GetShopOrdersSuccess,
        GetCompleteProcessingOrdersSuccess,
        GetWaitingDeliveryPartnerOrdersSuccess,
        GetDeliveringOrdersSuccess,
      ],
      builder: (state) {
        if (state is GetShopOrdersSuccess) {
          return ShopOrderSliverList(orders: state.data);
        }

        if (state is GetCompleteProcessingOrdersSuccess) {
          return CompleteProcessingOrderGroupSlvList(
            completeProcessingOrderGroup: state.data,
          );
        }

        if (state is GetWaitingDeliveryPartnerOrdersSuccess) {
          return WaitingDeliveryPartnerOrderGroupSlvList(
            waitingDeliveryPartnerOrderGroup: state.data,
          );
        }

        if (state is GetDeliveringOrdersSuccess) {
          return DeliveringOrdersGroupSlvList(
            deliveringOrders: state.data,
          );
        }

        return const SliverSizedBox();
      },
    );
  }
}
