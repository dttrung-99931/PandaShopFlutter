// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  AppIconButton({
    Key? key,
    this.title,
    this.onPressed,
    required this.iconData,
    this.color = AppColors.white,
    this.size = 22,
    double? fontSize,
    EdgeInsets? padding,
  })  : fontSize = fontSize ?? textTheme.bodySmall!.fontSize!,
        padding = padding ?? const EdgeInsets.all(4.0),
        super(key: key);
  final String? title;
  final IconData iconData;
  final Function()? onPressed;
  final Color color;
  final double size;
  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: color, size: size),
            if (title != null)
              Text(
                title!,
                style: textTheme.bodySmall.withColor(color).withSize(fontSize),
              ),
          ],
        ),
      ),
    );
  }
}
