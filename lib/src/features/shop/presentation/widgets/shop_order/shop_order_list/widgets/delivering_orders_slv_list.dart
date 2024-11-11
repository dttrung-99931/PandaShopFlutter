// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/widgets/icon_title.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';

class DeliveringOrdersGroupSlvList extends StatelessWidget {
  const DeliveringOrdersGroupSlvList({
    super.key,
    required this.deliveringOrders,
  });

  final List<DeliveryWithOrdersResponseDto> deliveringOrders;

  @override
  Widget build(BuildContext context) {
    if (deliveringOrders.isEmpty) {
      return const EmptyData(title: 'Chưa có đơn hàng', isSliver: true);
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: deliveringOrders.length,
        (context, index) {
          DeliveryWithOrdersResponseDto delivery = deliveringOrders[index];
          List<OrderDto> orders = deliveringOrders[index].orders;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? 8.shb : 20.shb,
              _DeliveryProgress(delivery: delivery),
              ...orders.mapList<Widget>((order) => ShopOrderItem(order: order))
            ],
          );
        },
      ),
    );
  }
}

class _DeliveryProgress extends StatelessWidget {
  const _DeliveryProgress({
    required this.delivery,
  });

  final DeliveryWithOrdersResponseDto delivery;

  @override
  Widget build(BuildContext context) {
    AddressDto addr = delivery.deliveryPartnerUnitAddress;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTitle(icon: Icons.location_on_outlined, title: addr.address),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    delivery.status.title,
                    style: textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (delivery.status == DeliveryStatus.delivering)
                    AppIconButton(
                      iconData: Icons.map_outlined,
                      color: AppColors.primaryShop,
                      padding: const EdgeInsets.all(2),
                      onPressed: () {
                        // TODO: Open map showing driver moving
                        // Shop no need to view more detail -> try this to impl map
                        // It's better to impl this for  buyer
                      },
                    )
                ],
              ),
              if (delivery.progress != null) ...[
                8.shb,
                LinearProgressIndicator(
                  value: 0.3,
                  // value: delivery.progress!.remainingDistance / delivery.progress!.distanceInMetter,
                  color: AppColors.green,
                  backgroundColor: AppColors.grey.withOpacity(0.3),
                ),
                2.shb,
              ],
            ],
          ),
        ),
      ],
    );
  }
}
