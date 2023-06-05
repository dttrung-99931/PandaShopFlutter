import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const CustomCard({Key? key, required this.child, this.padding = const EdgeInsets.all(16)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EVMColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(color: EVMColors.black.withOpacity(.3), blurRadius: 2),
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}
