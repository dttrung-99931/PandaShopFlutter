// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_actions_widget_factory.dart';

class StartProcessingAction extends OrderActionsWidget {
  const StartProcessingAction({super.key, required super.order});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomButton(
        backgroundColor: AppColors.primaryShop,
        icon: Icon(Icons.inventory_2_outlined, size: 24.r),
        iconSpacing: 8.w,
        height: 36.h,
        elevation: 0,
        title: 'Xử lý đơn hàng',
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        titleFontSize: 16.sp,
        onPressed: () {
          // orderProcessBloc.add(OnStartProcessingOrder(order: order));
        },
      ),
    );
  }
}
