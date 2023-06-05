import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimensions {
  static EdgeInsets signUpPadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.width * .08);
  }

  static double settingMenuExpandWidth(BuildContext context) {
    return context.width * .17;
  }

  static double settingMenuCollapseWidth(BuildContext context) {
    return context.width * .046;
  }

  static double get appBarHeight => 56.h;
}
