import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeutralButton extends StatelessWidget {
  const NeutralButton({
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.color = EVMColors.blackLight,
    this.labelStyle,
    this.fontSize,
    this.disabledColor = EVMColors.grey3,
    this.borderRadius = 4,
    super.key,
  });

  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color color;
  final TextStyle? labelStyle;
  final double? fontSize;
  final Color disabledColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: onPressed != null ? color : disabledColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: FittedBox(
          child: Text(
            tr(label),
            style: labelStyle ??
                textTheme.bodyMedium!.copyWith(
                  color: onPressed != null ? color : disabledColor,
                  fontSize: fontSize,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
