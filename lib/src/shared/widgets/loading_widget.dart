import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.size = 20, this.color = EVMColors.primary, Key? key}) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 1.8.w,
        ),
      ),
    );
  }
}
