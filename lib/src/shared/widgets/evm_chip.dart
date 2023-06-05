import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EVMChip extends StatelessWidget {
  const EVMChip({
    required this.label,
    required this.color,
    this.backgroundColor = EVMColors.white,
    this.isOutlined = false,
    this.padding,
    this.leftMargin = 0,
    super.key,
  });

  final String label;
  final Color color;
  final Color backgroundColor;
  final bool isOutlined;
  final EdgeInsets? padding;
  final double leftMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isOutlined ? backgroundColor : color,
        border: Border.all(color: color, width: 2.w),
      ),
      margin: EdgeInsets.only(left: leftMargin),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Text(
        label,
        style: textTheme.labelMedium!.copyWith(color: isOutlined ? color : EVMColors.white),
      ),
    );
  }
}
