import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsets padding;
  final Color backgroundColor;

  const MyCard({
    super.key,
    required this.child,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(12),
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
        boxShadow: [BoxShadow(offset: Offset(-elevation, elevation), color: Colors.black.withOpacity(0.04))],
      ),
      child: child,
    );
  }
}
