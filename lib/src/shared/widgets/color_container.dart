import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/cupertino.dart';

/// Widget that used to to determine how much space [child] take
/// by set a background color
class ColorContainer extends StatelessWidget {
  final Widget child;
  const ColorContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EVMColors.green,
      child: child,
    );
  }
}
