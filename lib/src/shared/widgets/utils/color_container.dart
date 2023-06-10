import 'package:flutter/material.dart';

// Widget that set green background color to test layout
class ColorContainer extends StatelessWidget {
  final Widget child;
  const ColorContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: child,
    );
  }
}
