// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanvideoAction extends StatelessWidget {
  const PanvideoAction({
    super.key,
    required this.icon,
    required this.count,
  });

  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      children: [
        Icon(
          icon,
          color: AppColors.whiteLight,
          size: 38.r,
        ),
        Text(
          '$count',
          style: textTheme.bodyMedium.withColor(AppColors.whiteLight),
        ),
      ],
    );
  }
}
