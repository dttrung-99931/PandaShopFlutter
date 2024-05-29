import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsets padding;

  const MyCard({
    super.key,
    required this.child,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(offset: Offset(-elevation, elevation), color: Colors.black.withOpacity(0.04))],
      ),
      child: child,
    );
  }
}
