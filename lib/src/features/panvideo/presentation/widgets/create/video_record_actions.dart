// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoRecordActions extends StatelessWidget {
  const VideoRecordActions({super.key, this.isVisibility = true});
  final bool isVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: !isVisibility
          ? emptyWidget
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // _buildAction(
                //   icon: Icons.cut,
                //   onPressed: () {},
                // ),
              ],
            ),
    );
  }

  IconButton _buildAction({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon, color: AppColors.white, size: 30.r),
      onPressed: onPressed,
    );
  }
}
