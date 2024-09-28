// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_actions_widget_factory.dart';

class CompleteProcessingAction extends OrderActionsWidget {
  const CompleteProcessingAction({super.key, required super.order});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomBlocConsumer<OrderProcessBloc>(
        listener: (state) {
          if (state is CompleteProcessingOrderSuccess) {
            shopOrderBloc.add(OnGetShopOrders(orderStatus: shopOrderBloc.selectedStatus));
          }
        },
        builder: (state) {
          return CustomButton(
            isLoading: state is LoadingState,
            backgroundColor: AppColors.primaryShop,
            icon: Icon(Icons.check, size: 24.r, color: AppColors.white),
            iconSpacing: 8.w,
            height: 36.h,
            elevation: 0,
            title: 'Hoàn thành xử lý',
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
            titleFontSize: 16.sp,
            onPressed: () {
              orderProcessBloc.add(OnCompleteProcessingOrder(order: order));
            },
          );
        },
      ),
    );
  }
}
