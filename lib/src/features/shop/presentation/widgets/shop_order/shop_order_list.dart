// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        if (state.orderStatus != OrderStatus.waitingForDelivering) {
          return ShopOrderSliverList(orders: state.data);
        }
        return WaitingDeliveringOrderGroupSliverList(
          deliveringOrdersByPartnerAddr: state.ordersGroupByDeliveryPartnerAddr.entries.toList(),
        );
      },
    );
  }
}

class WaitingDeliveringOrderGroupSliverList extends StatelessWidget {
  const WaitingDeliveringOrderGroupSliverList({
    super.key,
    required this.deliveringOrdersByPartnerAddr,
  });

  final List<MapEntry<AddressDto, List<OrderDto>>> deliveringOrdersByPartnerAddr;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: deliveringOrdersByPartnerAddr.length,
        (context, index) {
          AddressDto addr = deliveringOrdersByPartnerAddr[index].key;
          List<OrderDto> orders = deliveringOrdersByPartnerAddr[index].value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? 8.shb : 20.shb,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    Icon(Icons.delivery_dining, size: 40.r),
                    8.swb,
                    Expanded(
                      child: Text(
                        addr.address,
                        style: textTheme.bodyLarge.withWeight(FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              ...orders.mapList<Widget>((order) => ShopOrderItem(order: order))
            ],
          );
        },
      ),
    );
  }
}

class ShopOrderSliverList extends StatelessWidget {
  const ShopOrderSliverList({
    super.key,
    required this.orders,
  });
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
