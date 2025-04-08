import 'package:evievm_app/core/utils/mixins/is_loading_mixin.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:redacted/redacted.dart';

extension ContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaQuerySize => mediaQuery.size;
  double get width => mediaQuerySize.width;
  double get height => mediaQuerySize.height;
  double get bottomInssets => mediaQuery.viewInsets.bottom;
  bool get isKeyboardShowing => bottomInssets > 0;
}

extension TextStyleExt on TextStyle? {
  TextStyle light() => this!.copyWith(fontWeight: FontWeight.w300);
  TextStyle regular() => this!.copyWith(fontWeight: FontWeight.w400);
  TextStyle bold() => this!.copyWith(fontWeight: FontWeight.bold);
  TextStyle semibold() => this!.copyWith(fontWeight: FontWeight.w600);

  TextStyle arial() => this!.copyWith(fontFamily: 'Arial');
  TextStyle notoSansJP() => this!.copyWith(fontFamily: 'NotoSansJP');

  TextStyle withColor(Color color) => this!.copyWith(color: color);
  TextStyle withSize(double fontSize) => this!.copyWith(fontSize: fontSize);
  TextStyle withHeight(double height) => this!.copyWith(height: height);
  TextStyle withWeight(FontWeight fw) => this!.copyWith(fontWeight: fw);
  TextStyle spacing(double spacing) => this!.copyWith(letterSpacing: spacing * 0);
  TextStyle overflowElipse() => this!.copyWith(overflow: TextOverflow.ellipsis);
  TextStyle withOpacity(double opacity) => this!.copyWith(
        color: this!.color!.withOpacity(opacity),
      );
}

extension GlobalKeyExt on GlobalKey {
  Offset get position {
    RenderBox renderBox = (currentContext!.findRenderObject() as RenderBox);
    return renderBox.localToGlobal(Offset.zero);
  }
}

final RedactedConfiguration skeletonConfiguration = RedactedConfiguration(
  redactedColor: AppColors.grey3,
  autoFillText: 'Loading skeleton ... ...',
  autoFillTexts: true,
);

final RedactedConfiguration skeletonTextShortConfiguration = RedactedConfiguration(
  redactedColor: AppColors.grey3,
  autoFillText: 'Loading',
  autoFillTexts: true,
);

extension WidgetExt on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }

  /// Convert widget to sekeleton
  /// [isLoading] is true, the widget will be shown as skeleton
  /// [fillTextLong] is true, the skeleton will be filled with long text
  Widget skeleton(
    bool isLoading,
    BuildContext context, {
    bool fillTextLong = true,
  }) {
    return redacted(
      context: context,
      redact: isLoading,
      configuration: fillTextLong ? skeletonConfiguration : skeletonTextShortConfiguration,
    );
  }

  /// Convert widget to sekeleton
  /// [loading] is a IsLoadingMixin that provides isLoading getter
  /// [fillTextLong] is true, the skeleton will be filled with long text
  Widget skeletonBy(
    IsLoadingMixin loading,
    BuildContext context, {
    bool fillTextLong = true,
  }) {
    return skeleton(loading.isLoading, context, fillTextLong: fillTextLong);
  }
}
