// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'shop_theme.dart';
part 'text_theme.dart';
part 'user_theme.dart';

ThemeData get theme => AppTheme.themeOf(Global.context);

class AppTheme extends InheritedWidget {
  final AppThemeState themneState;

  const AppTheme({
    super.key,
    required this.themneState,
    required super.child,
  });

  static AppThemeState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.themneState;
  }

  static ThemeData themeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.themneState.themeData;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class AppThemeWidget extends StatefulWidget {
  const AppThemeWidget({
    super.key,
    required this.builder,
  });
  final WidgetBuilder builder;

  @override
  State<AppThemeWidget> createState() => AppThemeState();
}

class AppThemeState extends State<AppThemeWidget> {
  late ThemeData themeData;
  @override
  void initState() {
    themeData = buildTheme();
    super.initState();
  }

  void updateTheme() {
    themeData = buildTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext _) {
    return AppTheme(
        themneState: this,
        child: Builder(
          /// widget.builder can access [themeData] via AppTheme.of(context)
          builder: (context) {
            return widget.builder(context);
          },
        ));
  }
}

ThemeData buildTheme() {
  return Global.isUserMode ? buildUserTheme() : buildShopTheme();
}
