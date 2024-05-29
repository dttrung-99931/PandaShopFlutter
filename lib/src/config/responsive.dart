import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

Widget responsiveBuilder(context, child) {
  return ResponsiveBreakpoints.builder(
    child: child,
    breakpoints: const [
      Breakpoint(start: 0, end: 480, name: MOBILE),
      Breakpoint(start: 451, end: 800, name: TABLET),
      Breakpoint(start: 801, end: 1000, name: DESKTOP),
    ],
  );
}
