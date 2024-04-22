// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/sub_order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/order_actions_widget_factory.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/widget/cart_item.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopOrderItem extends StatelessWidget {
  const ShopOrderItem({
    super.key,
    required this.order,
  });

  final OrderDto order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          ...order.subOrders.mapList(
            (subOrder) => ShopSubOrderItem(subOrder: subOrder),
          )
        ],
      ),
    );
  }
}

class ShopSubOrderItem extends StatelessWidget {
  const ShopSubOrderItem({
    Key? key,
    required this.subOrder,
  }) : super(key: key);
  final SubOrderDto subOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...subOrder.subOrderDetails.mapList(
          (detail) => CartItem(
            item: CartItemDto.from(
              subOrderDetail: detail,
              shop: Global.shop!,
            ),
            mode: CartItemMode.shopOrder,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 8.shb,
              Row(
                children: [
                  Expanded(
                    child: Section(
                      title: subOrder.delivery.deliveryMethod.name,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(subOrder.delivery.address.address),
                        ],
                      ),
                    ),
                  ),
                  16.swb,
                  Avatar(size: 16.r),
                ],
              ),
              if (subOrder.note != null) ...[
                8.shb,
                Section(
                  title: 'Ghi chú',
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subOrder.note!),
                    ],
                  ),
                ),
              ],
              8.shb,
              OrderActionsWidgetFactory.buildOrderActions(subOrder),
              8.shb,
            ],
          ),
        ),
      ],
    );
  }
}
