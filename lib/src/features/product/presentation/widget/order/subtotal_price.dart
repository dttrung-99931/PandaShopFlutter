// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/order/order_confirm_dto.dart';
import 'package:evievm_app/src/features/product/presentation/widget/price_widget.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/spacing_column.dart';
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
      child: Section(
        title: 'Tổng tiền',
        titlePadding: EdgeInsets.only(top: 2.h, bottom: 4.h),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: SpacingColumn(
          spacing: 4.h,
          children: [
            _Row(
              title: 'Tạm tính: ',
              value: PriceWidget(orderConfirm.subtotal),
            ),
            _Row(
              title: 'Cước vận chuyển (nhanh): ',
              value: PriceWidget(orderConfirm.shippingFee),
            ),
            _Row(
              title: 'VAT (${orderConfirm.vatPercents}%): ',
              value: PriceWidget(orderConfirm.vatPrice),
            ),
            _Row(
              title: 'Tổng cộng: ',
              value: PriceWidget(orderConfirm.totalPrice, isLarge: true),
            ),
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
        Text(title, style: textTheme.bodyMedium),
        const Spacer(),
        SizedBox(height: 28.h, child: value),
      ],
    );
  }
}
