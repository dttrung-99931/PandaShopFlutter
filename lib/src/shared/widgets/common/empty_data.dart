import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
    required this.title,
    this.isSliver = false,
  });
  final String title;
  final bool isSliver;
  @override
  Widget build(BuildContext context) {
    var center = Center(child: Text(title, style: textTheme.bodyMedium));
    if (isSliver) {
      return SliverFillRemaining(child: center);
    }
    return center;
  }
}
