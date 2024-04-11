// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalDivider extends StatelessWidget {
  HorizontalDivider({
    super.key,
    double? paddingHorizontal,
    double? paddingVertical,
    this.color = AppColors.divider,
  })  : paddingHorizontal = paddingHorizontal ?? 28.w,
        paddingVertical = paddingVertical ?? 0;
  final double paddingHorizontal;
  final double paddingVertical;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: paddingHorizontal,
      endIndent: paddingHorizontal,
      height: 32.h + paddingVertical * 2,
      color: AppColors.divider,
    );
  }
}
