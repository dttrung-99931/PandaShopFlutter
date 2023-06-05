import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// Widget that used to to determine how much space [child] take
/// by set a background color
class ColorContainer extends StatelessWidget {
  final Widget child;
  const ColorContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EVMColors.green,
      child: child,
    );
  }
}
