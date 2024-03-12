import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaQuerySize => mediaQuery.size;
  double get width => mediaQuerySize.width;
  double get height => mediaQuerySize.height;
}

extension TextStyleExt on TextStyle {
  TextStyle light() => copyWith(fontWeight: FontWeight.w300);
  TextStyle regular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);
  TextStyle semibold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle arial() => copyWith(fontFamily: 'Arial');
  TextStyle notoSansJP() => copyWith(fontFamily: 'NotoSansJP');

  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle spacing(double spacing) => copyWith(letterSpacing: spacing * 0);
}

extension GlobalKeyExt on GlobalKey {
  Offset get position {
    RenderBox renderBox = (currentContext!.findRenderObject() as RenderBox);
    return renderBox.localToGlobal(Offset.zero);
  }
}

extension WidgetExt on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }
}
