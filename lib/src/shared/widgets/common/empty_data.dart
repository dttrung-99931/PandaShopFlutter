import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: textTheme.bodyMedium));
  }
}
