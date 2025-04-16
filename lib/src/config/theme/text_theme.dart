part of 'app_theme.dart';

AppTextTheme? _textTheme;

AppTextTheme get textTheme {
  return _textTheme ?? (_textTheme ??= AppTheme.of(Global.context).themeData.textTheme as AppTextTheme);
}

AppTextTheme buildTextTheme() {
  return AppTextTheme(
    /// Title with custom font
    titleLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'Poppins',
    ),
    titleMediumSm: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'Poppins',
    ),

    /// Body with custom font
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'OpenSans',
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'OpenSans',
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.black,
      fontFamily: 'OpenSans',
    ),

    /// Label with custom font
    labelLarge: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    ),
  );
}
