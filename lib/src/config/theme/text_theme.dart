part of 'app_theme.dart';

TextTheme? _textTheme;

TextTheme get textTheme => _textTheme ?? (_textTheme ??= Theme.of(Global.context).textTheme);

TextTheme buildTextTheme() {
  return TextTheme(
    /// Title with custom font
    titleLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
      fontFamily: 'Poppins',
    ),

    /// Body with custom font
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
      fontFamily: 'OpenSans',
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
      fontFamily: 'OpenSans',
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: EVMColors.blackLight,
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
