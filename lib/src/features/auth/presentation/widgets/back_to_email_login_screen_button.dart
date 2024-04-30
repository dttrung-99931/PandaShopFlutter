import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BackToEmailLoginScreenButton extends StatelessWidget {
  const BackToEmailLoginScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Global.navigator.popUntil((route) => !Global.navigator.canPop());
      },
      child: Text(
        tr('auth.back_to_login_screen'),
        style: textTheme.bodyMedium?.copyWith(color: EVMColors.primary),
      ),
    );
  }
}
