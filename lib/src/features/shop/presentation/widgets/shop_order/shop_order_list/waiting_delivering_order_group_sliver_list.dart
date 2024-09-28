// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
