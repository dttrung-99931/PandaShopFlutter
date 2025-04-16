import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    super.displayLarge,
    super.displayMedium,
    super.displaySmall,
    super.headlineLarge,
    super.headlineMedium,
    super.headlineSmall,
    super.titleLarge,
    required this.titleMediumSm,
    super.titleMedium,
    super.titleSmall,
    super.bodyLarge,
    super.bodyMedium,
    super.bodySmall,
    super.labelLarge,
    super.labelMedium,
    super.labelSmall,
  });
  final TextStyle titleMediumSm;

  /// Merge AppTextTheme's styles with [other]'s styles
  /// Meaning that AppTextTheme will have missing styles from [other]
  @override
  AppTextTheme merge(TextTheme? other) {
    if (other == null) {
      return this;
    }
    return AppTextTheme(
      displayLarge: displayLarge?.merge(other.displayLarge) ?? other.displayLarge,
      displayMedium: displayMedium?.merge(other.displayMedium) ?? other.displayMedium,
      displaySmall: displaySmall?.merge(other.displaySmall) ?? other.displaySmall,
      headlineLarge: headlineLarge?.merge(other.headlineLarge) ?? other.headlineLarge,
      headlineMedium: headlineMedium?.merge(other.headlineMedium) ?? other.headlineMedium,
      headlineSmall: headlineSmall?.merge(other.headlineSmall) ?? other.headlineSmall,
      titleLarge: titleLarge?.merge(other.titleLarge) ?? other.titleLarge,
      titleMedium: titleMedium?.merge(other.titleMedium) ?? other.titleMedium,
      titleSmall: titleSmall?.merge(other.titleSmall) ?? other.titleSmall,
      bodyLarge: bodyLarge?.merge(other.bodyLarge) ?? other.bodyLarge,
      bodyMedium: bodyMedium?.merge(other.bodyMedium) ?? other.bodyMedium,
      bodySmall: bodySmall?.merge(other.bodySmall) ?? other.bodySmall,
      labelLarge: labelLarge?.merge(other.labelLarge) ?? other.labelLarge,
      labelMedium: labelMedium?.merge(other.labelMedium) ?? other.labelMedium,
      labelSmall: labelSmall?.merge(other.labelSmall) ?? other.labelSmall,
      titleMediumSm: titleMediumSm,
    );
  }
}
