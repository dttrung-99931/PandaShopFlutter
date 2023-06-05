import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanOrderButton extends StatelessWidget {
  const ScanOrderButton({this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      title: 'common.scan_camera',
      icon: Padding(
        padding: EdgeInsets.only(bottom: 3.h),
        child: SvgPicture.asset(Assets.ic.cameraScan, height: 26.h),
      ),
      padding: EdgeInsets.only(left: 8.w, right: 24.w, top: 5.5.h, bottom: 5.5.h),
      titleStyle: textTheme.bodySmall!.copyWith(color: EVMColors.white),
      elevation: 0,
      iconSpacing: 4,
    );
  }
}

class IssuedOrdersButton extends StatelessWidget {
  const IssuedOrdersButton({this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      title: 'top.issued_instruction_num',
      icon: SvgPicture.asset(Assets.ic.scannerScan, height: 26.h),
      padding: EdgeInsets.only(left: 8.w, right: 12.w, top: 7.h, bottom: 7.h),
      titleStyle: textTheme.bodySmall!.copyWith(color: EVMColors.white),
      elevation: 0,
      iconSpacing: 4.w,
    );
  }
}

class OrderQuantityWidget extends StatelessWidget {
  const OrderQuantityWidget({
    this.title = 'common.orders',
    this.number = 0,
    this.numberAlt,
    this.current,
    this.unitLabel = 'common.sheet',
    super.key,
  });

  final String title;
  final int number;
  final String? numberAlt;
  final int? current;
  final String unitLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(tr(title), style: textTheme.labelMedium!.copyWith(color: EVMColors.blackLight)),
          Text.rich(
            TextSpan(
              children: [
                if (current == null)
                  TextSpan(
                    text: numberAlt ??  '$number',
                    style: textTheme.titleMedium!.arial().bold().withColor(EVMColors.primary),
                  )
                else
                  TextSpan(
                    text: '$current/$number',
                    style: textTheme.bodyLarge!.arial().bold().withColor(EVMColors.primary),
                  ),
                WidgetSpan(child: sw(3.w)),
                TextSpan(text: tr(unitLabel), style: textTheme.bodySmall!.withColor(EVMColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
