import 'package:flutter/cupertino.dart';

class AlignLeft extends StatelessWidget {
  final Widget child;

  const AlignLeft({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
