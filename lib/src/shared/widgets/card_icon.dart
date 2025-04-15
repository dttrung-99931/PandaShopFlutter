import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'my_card.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({
    required this.iconData,
    this.padding = const EdgeInsets.all(12),
    this.backgroundColor = AppColors.white,
    this.color,
    super.key,
  });
  final IconData iconData;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color? color;

  factory CardIcon.zeroPadding(
    IconData iconData, {
    Color backgroundColor = AppColors.white,
    Color? color,
  }) {
    return CardIcon(
      iconData: iconData,
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: padding,
      elevation: 2,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Icon(iconData, color: color),
      ),
    );
  }
}
