import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../section.dart';

class SliverSection extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets titlePadding;
  final EdgeInsets padding;

  // ignore: use_key_in_widget_constructors
  const SliverSection({
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Section(
        title: title,
        padding: padding,
        titlePadding: titlePadding,
        child: child,
      ),
    );
  }
}
