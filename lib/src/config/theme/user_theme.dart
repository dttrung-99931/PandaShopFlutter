part of 'app_theme.dart';

ThemeData buildUserTheme() {
  final theme = ThemeData(
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
  );

  /// Set textTheme to theme by copyWith to keep AppTextTheme type return by buildTextTheme
  return theme.copyWith(
    textTheme: buildTextTheme(),
  );
}
