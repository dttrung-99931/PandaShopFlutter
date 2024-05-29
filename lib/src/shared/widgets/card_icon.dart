import 'package:flutter/material.dart';
import 'my_card.dart';

class CardIcon extends StatelessWidget {
  const CardIcon(
    this.iconData, {
    this.padding = const EdgeInsets.all(12),
    super.key,
  });
  final IconData iconData;
  final EdgeInsets padding;

  factory CardIcon.zeroPadding(IconData iconData) {
    return CardIcon(iconData, padding: EdgeInsets.zero);
  }

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: padding,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Icon(iconData),
      ),
    );
  }
}
