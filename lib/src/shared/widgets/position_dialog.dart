import 'package:flutter/material.dart';

import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';

class PositionDialog extends StatelessWidget {
  const PositionDialog({
    Key? key,
    required this.child,
    required this.showingPosition,
  }) : super(key: key);

  final Widget child;
  final Offset showingPosition;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      backgroundColor: EVMColors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Global.hideDialog(context);
              },
            ),
          ),
          Positioned(
            left: showingPosition.dx,
            top: showingPosition.dy,
            child: child,
          ),
        ],
      ),
    );
  }
}
