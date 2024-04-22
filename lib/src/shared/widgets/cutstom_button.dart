import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:evievm_app/src/shared/widgets/utils/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sized_box.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Widget? icon;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color loadingColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double elevation;
  final double titleFontSize;
  final bool isTitleBold;
  final double iconSpacing;
  final TextStyle? titleStyle;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.title,
    this.child,
    this.onPressed,
    this.width,
    this.borderRadius = 6,
    this.elevation = 5,
    this.backgroundColor = AppColors.primary,
    this.loadingColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
    this.margin = EdgeInsets.zero,
    this.titleFontSize = 14,
    this.icon,
    this.iconSpacing = 12,
    this.titleStyle,
    this.height,
    this.isTitleBold = false,
    this.isLoading = false,
  })  : assert((title != null) != (child != null), 'Either title or child must be not null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = titleStyle ??
        textTheme.bodyMedium!.copyWith(
          color: EVMColors.white,
          fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: titleFontSize,
        );
    if (isLoading) {
      style = style.copyWith(color: backgroundColor);
    }
    Widget buttonContent = child ??
        Text(
          tr(title!),
          style: style.withHeight(1.3),
          textAlign: TextAlign.center,
        );
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
                if (!isLoading) onPressed?.call();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: padding,
          elevation: elevation,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) sw(iconSpacing),
            isLoading
                ? Stack(
                    children: [
                      buttonContent,
                      Positioned.fill(child: LoadingWidget(size: 24.r, color: loadingColor)),
                    ],
                  )
                : buttonContent,
          ],
        ),
      ),
    );
  }
}
