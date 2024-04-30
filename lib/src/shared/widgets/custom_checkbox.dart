import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({
    required this.value,
    this.enabled = true,
    this.onTap,
    this.label,
    this.size,
    this.shape = BoxShape.circle,
    this.labelStyle,
    this.spacing,
    super.key,
    EdgeInsets? checkPadding,
    this.uncheckBackgroundColor,
  }) : checkPadding = checkPadding ?? EdgeInsets.only(top: 8.h, bottom: 7.h);

  final bool value;
  final void Function()? onTap;
  final bool enabled;
  final String? label;
  final double? size;
  final BoxShape shape;
  final TextStyle? labelStyle;
  final double? spacing;
  final EdgeInsets checkPadding;
  final Color? uncheckBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: size ?? 24.w,
              width: size ?? 24.w,
              decoration: BoxDecoration(
                shape: shape,
                color: value ? EVMColors.blue : uncheckBackgroundColor,
                border: value ? null : Border.all(color: EVMColors.blackLight),
                borderRadius: shape == BoxShape.rectangle ? BorderRadius.circular(4) : null,
              ),
              alignment: Alignment.center,
              padding: checkPadding,
              child: value ? SvgPicture.asset(Assets.ic.checkRounded, color: Colors.white) : null,
            ),
            if (label != null)
              Padding(
                padding: EdgeInsets.only(left: spacing ?? 6.w),
                child: Text(label!.tr(), style: labelStyle ?? textTheme.bodySmall),
              ),
          ],
        ),
      ),
    );
  }
}
