// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dotted_border/dotted_border.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingPannel extends StatelessWidget {
  const AddingPannel({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });
  final String title;
  final Function() onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        child: DottedBorder(
          radius: Radius.circular(8.r),
          color: AppColors.blackLight,
          strokeCap: StrokeCap.butt,
          borderPadding: EdgeInsets.all(16.r),
          dashPattern: const [6, 2],
          child: Center(
            child: AppIconButton(
              title: title,
              iconData: Icons.add,
              color: AppColors.blackLight,
            ),
          ),
        ),
      ),
    );
  }
}
