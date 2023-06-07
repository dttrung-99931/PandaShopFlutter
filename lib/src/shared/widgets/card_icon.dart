import 'package:flutter/material.dart';
import 'my_card.dart';

class CardIcon extends StatelessWidget {
  final IconData iconData;
  const CardIcon(
    this.iconData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Icon(iconData),
      ),
    );
  }
}
