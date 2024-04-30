import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelCheckbox extends StatelessWidget {
  const LabelCheckbox({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.selectedBackgroundColor,
    this.onTap,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color selectedBackgroundColor;
  final Function()? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final titleColor = isSelected ? selectedColor : EVMColors.grey5;
    final backgroundColor = isSelected ? selectedBackgroundColor : EVMColors.white;
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.4,
        child: Container(
          height: 32.h,
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: selectedColor, width: 1.6)
                : Border.all(color: EVMColors.blackLight, width: 1),
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: isSelected ? 10.w : 20.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected)
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: SvgPicture.asset(Assets.ic.checkRounded, color: selectedColor, width: 14.w),
                ),
              Text(label, style: textTheme.bodySmall!.copyWith(color: titleColor)),
            ],
          ),
        ),
      ),
    );
  }
}
