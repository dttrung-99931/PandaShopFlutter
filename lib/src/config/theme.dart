import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData? _landscapeThemeData;
ThemeData? _portraitThemeData;
TextTheme? _textTheme;

ThemeData theme(BuildContext context) {
  final themeData = ThemeData(
    fontFamily: 'NotoSansJP',
    colorScheme: const ColorScheme.light(
      primary: EVMColors.primary,
    ),
    appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
    textTheme: Theme.of(context).textTheme.copyWith(
          /// Title
          titleLarge: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),
          titleMedium: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),
          titleSmall: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),
          bodySmall: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: EVMColors.blackLight,
          ),

          /// Lable
          labelMedium: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),

          labelSmall: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
  );

  if (ScreenUtil().orientation == Orientation.portrait) {
    _portraitThemeData ??= themeData;
    return _landscapeThemeData ?? _portraitThemeData!;
  } else {
    _landscapeThemeData ??= themeData;
    _textTheme ??= _landscapeThemeData?.textTheme;
    return _landscapeThemeData!;
  }
}

TextTheme get textTheme => _textTheme ?? Theme.of(Global.context).textTheme;
