import 'package:evievm_app/core/utils/mixins/is_loading_mixin.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:redacted/redacted.dart';

extension SkeletonWidgetExt on Widget {
  /// Convert widget to sekeleton
  /// [isLoading] is true, the widget will be shown as skeleton
  /// [textLongLevel] is the length level of text to fill in skeleton
  Widget skeleton(
    bool isLoading,
    BuildContext context, {
    TextLongLevel textLongLevel = TextLongLevel.long,
  }) {
    return redacted(
      context: context,
      redact: isLoading,
      configuration: textLongMap[textLongLevel]!,
    );
  }

  /// Convert widget to skeleton with isLoading set to true
  Widget skeletonLoading(BuildContext context, {TextLongLevel fillTextLong = TextLongLevel.long}) {
    return skeleton(true, context, textLongLevel: fillTextLong);
  }

  /// Convert widget to skeleton
  /// [loading] is a IsLoadingMixin that provides isLoading getter
  /// [textLongLevel] is the length level of text to fill in skeleton
  Widget skeletonBy(
    IsLoadingMixin loading,
    BuildContext context, {
    TextLongLevel textLongLevel = TextLongLevel.long,
  }) {
    return skeleton(loading.isLoading, context, textLongLevel: textLongLevel);
  }
}

enum TextLongLevel {
  short,
  long,
  veryLong,
  multipleLines;

  String get text {
    switch (this) {
      case TextLongLevel.short:
        return 'Loading';
      case TextLongLevel.long:
        return 'Loading skeleton ... ...';
      case TextLongLevel.veryLong:
        return 'Loading skeleton ... ... ... ... Loading skeleton ... ... ... ... Loading skeleton ... ... ... ...';
      case TextLongLevel.multipleLines:
        return 'Loading skeleton ... ... ... ... ... ... '
            'Loading skeleton ... ... ... ...  ... ...'
            'Loading skeleton ... ... ... ...  ... ...'
            'Loading skeleton ... ... ... ...  ... ...'
            'Loading skeleton ... ... ... ... ...';
    }
  }
}

final Map<TextLongLevel, RedactedConfiguration> textLongMap = {
  for (var textLevel in TextLongLevel.values)
    textLevel: RedactedConfiguration(
      redactedColor: AppColors.grey3,
      autoFillText: textLevel.text,
      autoFillTexts: true,
    ),
};
