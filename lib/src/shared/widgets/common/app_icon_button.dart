// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.iconData,
    this.color = AppColors.white,
    this.size = 22,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final Function() onPressed;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, color: color, size: size),
        Text(
          title,
          style: textTheme.bodySmall.withColor(color),
        ),
      ],
    );
  }
}
