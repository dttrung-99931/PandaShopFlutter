part of 'app_theme.dart';

ThemeData buildShopTheme() {
  return ThemeData(
    fontFamily: 'Arial',
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryShop,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      backgroundColor: AppColors.primaryShop,
    ),
    textTheme: buildTextTheme(),
  );
}
