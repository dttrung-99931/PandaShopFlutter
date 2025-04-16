part of 'app_theme.dart';

ThemeData buildShopTheme() {
  final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryShop,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      backgroundColor: AppColors.primaryShop,
    ),
  );

  /// Set textTheme to theme by copyWith to keep AppTextTheme type return by buildTextTheme
  return theme.copyWith(
    textTheme: buildTextTheme(),
  );
}
