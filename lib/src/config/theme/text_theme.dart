part of 'app_theme.dart';

TextTheme? _textTheme;

TextTheme get textTheme => _textTheme ?? (_textTheme ??= Theme.of(Global.context).textTheme);

TextTheme buildTextTheme() {
  return TextTheme(
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
  );
}
