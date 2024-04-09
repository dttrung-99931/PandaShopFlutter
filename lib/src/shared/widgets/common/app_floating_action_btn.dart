// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color = AppColors.primaryShop,
  }) : super(key: key);

  final Function() onPressed;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      tooltip: title,
      backgroundColor: color,
      child: Icon(Icons.add, color: AppColors.white, size: 20.r),
    );
  }
}
