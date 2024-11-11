// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/icon_title.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaitingDeliveryPartnerOrderGroupSlvList extends StatelessWidget {
  const WaitingDeliveryPartnerOrderGroupSlvList({
    super.key,
    required this.waitingDeliveryPartnerOrderGroup,
  });

  final List<DeliveryWithOrdersResponseDto> waitingDeliveryPartnerOrderGroup;

  @override
  Widget build(BuildContext context) {
    if (waitingDeliveryPartnerOrderGroup.isEmpty) {
      return const EmptyData(title: 'Chưa có đơn hàng', isSliver: true);
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: waitingDeliveryPartnerOrderGroup.length,
        (context, index) {
          DeliveryWithOrdersResponseDto delivery = waitingDeliveryPartnerOrderGroup[index];
          List<OrderDto> orders = waitingDeliveryPartnerOrderGroup[index].orders;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? 8.shb : 20.shb,
              _DeliveryInfo(delivery: delivery),
              ...orders.mapList<Widget>((order) => ShopOrderItem(order: order))
            ],
          );
        },
      ),
    );
  }
}

class _DeliveryInfo extends StatelessWidget {
  const _DeliveryInfo({
    required this.delivery,
  });

  final DeliveryWithOrdersResponseDto delivery;

  @override
  Widget build(BuildContext context) {
    AddressDto addr = delivery.deliveryPartnerUnitAddress;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text.rich(
            TextSpan(
              text: '#${delivery.id}',
              style: textTheme.titleSmall,
              children: [
                WidgetSpan(child: 4.swb),
                TextSpan(
                  text: delivery.status.title,
                )
              ],
            ),
          ),
        ),
        6.shb,
        IconTitle(
          icon: Icons.location_on_outlined,
          title: addr.address,
        ),
      ],
    );
  }
}
