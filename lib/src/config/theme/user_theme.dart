part of 'app_theme.dart';

ThemeData buildUserTheme() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    textTheme: buildTextTheme(),
  );
}
