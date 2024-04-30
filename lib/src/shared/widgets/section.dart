import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_theme.dart';

class Section extends StatelessWidget {
  static final EdgeInsets defaultMargin = EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w);
  final Widget child;
  final String? title;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final EdgeInsets titlePadding;
  final EdgeInsets? contentPadding;
  final double spacing;
  final BoxDecoration? decoration;

  Section({
    super.key,
    required this.child,
    this.title,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
    this.contentPadding,
    this.spacing = 0,
    this.decoration,
    EdgeInsets? margin,
  }) : margin = margin ?? defaultMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? const BoxDecoration(color: EVMColors.white),
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: titlePadding,
              child: Text(
                title!,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: EVMColors.black,
                ),
              ),
            ),
          sh(spacing),
          Padding(padding: contentPadding ?? EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w), child: child),
        ],
      ),
    );
  }
}
