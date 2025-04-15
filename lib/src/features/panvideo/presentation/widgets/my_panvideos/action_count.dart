// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionCount extends StatelessWidget {
  const ActionCount({
    super.key,
    required this.icon,
    required this.count,
  });

  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$count',
          style: textTheme.bodySmall.withColor(Colors.white54),
        ),
        4.swb,
        Icon(
          icon,
          color: Colors.white54,
          size: 16.sp,
        ),
      ],
    );
  }
}
