// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/src/features/order/data/models/response/order/delivery_response_model.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        _IconTitle(icon: Icons.location_on_outlined, title: addr.address),
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

class _IconTitle extends StatelessWidget {
  const _IconTitle({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Icon(icon, size: 40.r),
          8.swb,
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyLarge.withWeight(FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
