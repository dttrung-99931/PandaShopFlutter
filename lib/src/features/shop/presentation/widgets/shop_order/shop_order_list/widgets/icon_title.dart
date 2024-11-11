// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32.r),
          8.swb,
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
