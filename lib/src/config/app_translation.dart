import 'dart:ui';

class AppTranslation {
  AppTranslation._();

  static const path = 'assets/translations';
  static const ja = Locale('ja', 'JA');
  static const en = Locale('en', 'US');

  static const List<Locale> supportedLocales = [ja, en];
}
