import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

Widget responsiveBuilder(context, child) {
  return ResponsiveWrapper.builder(
    child,
    maxWidth: 2732,
    minWidth: 480,
    defaultScale: true,
    breakpoints: const [
      ResponsiveBreakpoint.resize(480, name: MOBILE),
      ResponsiveBreakpoint.autoScale(800, name: TABLET),
      ResponsiveBreakpoint.resize(1000, name: DESKTOP),
    ],
  );
}
