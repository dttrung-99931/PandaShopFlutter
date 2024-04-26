// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChip extends StatelessWidget {
  AppChip({
    Key? key,
    this.isSelected = true,
    required this.label,
    this.isSelectable = true,
    this.isOutlineColor = false,
    this.showClose = false,
    this.onIconPressed,
    this.onPressed,
    this.iconData = Icons.clear,
    Color? selectedColor,
    double? horizontalPadding,
    double? verticalPadding,
    double? fontSize,
  })  : selectedColor = selectedColor ?? AppColors.primary.shade400,
        horizontalPadding = horizontalPadding ?? 12.h,
        verticalPadding = verticalPadding ?? 8.h,
        fontSize = fontSize ?? textTheme.bodyMedium!.fontSize!,
        super(key: key);
  final bool isSelected;
  final bool isSelectable;
  final String label;
  final Color selectedColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final bool isOutlineColor;
  final Function()? onIconPressed;
  final Function()? onPressed;
  final bool showClose;
  final IconData iconData;
  Color? get backgroundColor {
    return isOutlineColor
        ? null
        : isSelected
            ? selectedColor
            : EVMColors.transparent;
  }

  Color? get textColor {
    return isOutlineColor
        ? null
        : isSelected
            ? AppColors.white
            : Colors.black.withOpacity(isSelectable ? 1 : .36);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          border: isOutlineColor ? Border.all(color: selectedColor) : null,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: textTheme.bodyMedium
                  ?.copyWith(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  )
                  .withHeight(1.15),
            ),
            sw(4.w),
            if (showClose)
              InkWell(
                onTap: onIconPressed,
                child: Icon(iconData, size: 16.r),
              ),
          ],
        ),
      ),
    );
  }
}
