import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_steps.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double translateX;

  const SignUpHeader({
    this.title = 'auth.register_new_evi_account',
    this.titleStyle,
    this.translateX = -SignUpStep.width / 2 + 32,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(translateX, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.ic.evm,
            color: EVMColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            tr(title),
            style: titleStyle ?? textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
