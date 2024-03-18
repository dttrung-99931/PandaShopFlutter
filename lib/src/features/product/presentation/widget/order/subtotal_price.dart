// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/product/domain/dto/order/order_confirm_dto.dart';
import 'package:evievm_app/src/features/product/presentation/widget/price_widget.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtotalPrices extends StatelessWidget {
  const SubtotalPrices({
    Key? key,
    required this.orderConfirm,
  }) : super(key: key);
  final OrderConfirmDto orderConfirm;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Row(title: 'sản phẩm đã chọn', value: Text(orderConfirm.total.toString())),
            _Row(title: 'sản phẩm đã chọn', value: PriceWidget(orderConfirm.totalPrice)),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        sw(8.w),
        value,
      ],
    );
  }
}
