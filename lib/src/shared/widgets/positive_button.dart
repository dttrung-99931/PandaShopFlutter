import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/evm_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading_widget.dart';

class PositiveButton extends StatelessWidget {
  const PositiveButton({
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.color = EVMColors.primary,
    this.elevation = 0,
    this.borderRadius = 4,
    this.labelStyle,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final double elevation;
  final double borderRadius;
  final TextStyle? labelStyle;
  final bool isLoading;

  double get _height => height ?? 48.h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: _height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? LoadingWidget(size: _height * 0.5)
            : FittedBox(
                child: EVMText(
                  tr(label),
                  style: labelStyle ?? textTheme.bodyMedium!.copyWith(color: EVMColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
