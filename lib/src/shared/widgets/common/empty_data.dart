import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: textTheme.bodyMedium));
  }
}
