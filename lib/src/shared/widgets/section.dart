import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../config/theme.dart';

class Section extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;

  const Section({
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(title, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
          ),
          child,
        ],
      ),
    );
  }
}
