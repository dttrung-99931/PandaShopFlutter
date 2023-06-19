import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme.dart';

class Section extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;

  const Section({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EVMColors.white,
      margin: EdgeInsets.only(top: 4.h),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: EVMColors.black,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w), child: child),
        ],
      ),
    );
  }
}
