// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChip extends StatelessWidget {
  AppChip({
    Key? key,
    required this.isSelected,
    required this.label,
    this.isSelectable = true,
    Color? selectedColor,
    double? horizontalPadding,
    double? verticalPadding,
    double? fontSize,
  })  : selectedColor = selectedColor ?? AppColors.primary.shade400,
        horizontalPadding = horizontalPadding ?? 12.h,
        verticalPadding = verticalPadding ?? 4.h,
        fontSize = fontSize ?? textTheme.bodyMedium!.fontSize!,
        super(key: key);
  final bool isSelected;
  final bool isSelectable;
  final String label;
  final Color selectedColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : EVMColors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        label,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          color: isSelected ? AppColors.white : Colors.black.withOpacity(isSelectable ? 1 : .36),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
