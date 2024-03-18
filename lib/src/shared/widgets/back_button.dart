// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';

import '../../../../../global.dart';

class PShopBackButton extends StatelessWidget {
  const PShopBackButton({
    Key? key,
    this.color = AppColors.black,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24.r),
      onTap: Global.pop,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Transform.translate(
          offset: Offset(3.w, 0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24.r,
            color: color,
          ),
        ),
      ),
    );
  }
}
