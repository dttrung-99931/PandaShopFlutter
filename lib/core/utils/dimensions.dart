import 'package:evievm_app/core/utils/app_colors.dart';
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
  // static double get paddingHorizontal => 12.w;
  static EdgeInsets get paddingAll => EdgeInsets.all(12.r);
  static EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: 12.w);

  static EdgeInsets get marginAll => EdgeInsets.all(12.r);
  static EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: 12.w);

  static double get productGridRatio => (10 / 16).r;

  static double get borderOpacity => .8;
  static double get borderOpacityLight => .4;
}
