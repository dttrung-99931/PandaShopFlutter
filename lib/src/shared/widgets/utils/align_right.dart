import 'package:flutter/cupertino.dart';

class AlignRight extends StatelessWidget {
  final Widget child;

  const AlignRight({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: child,
    );
  }
}
