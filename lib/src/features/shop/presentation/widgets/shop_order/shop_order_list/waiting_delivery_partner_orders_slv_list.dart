// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/temp_delivery_response_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_item.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
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
          AddressDto addr = waitingDeliveryPartnerOrderGroup[index].deliveryPartnerUnitAddress;
          List<OrderDto> orders = waitingDeliveryPartnerOrderGroup[index].orders;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? 8.shb : 20.shb,
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: _RequestPartnerDeliveryButton(waitingDeliveryPartnerOrderGroup[index]),
              // ),
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

class _RequestPartnerDeliveryButton extends StatelessWidget {
  const _RequestPartnerDeliveryButton(this.tempDelivery);
  final TempDeliveryResponseDto tempDelivery;

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<OrderProcessBloc>(
      listenForStates: const [LoadingState, ErrorState, RequestPartnerDeliverySuccess],
      handleGlobalLoading: true,
      listener: (state) {},
      child: CustomButton(
        margin: EdgeInsets.only(right: 12.w),
        backgroundColor: AppColors.primaryShop,
        icon: Icon(Icons.local_shipping_outlined, size: 24.r, color: AppColors.white),
        iconSpacing: 8.w,
        height: 36.h,
        elevation: 0,
        title: 'Giao shiper',
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        titleFontSize: 16.sp,
        onPressed: () {
          orderProcessBloc.add(OnRequestPartnerDelivery(
            requestModel: tempDelivery.toRequestPartnerDeliveryModel(),
          ));
        },
      ),
    );
  }
}
