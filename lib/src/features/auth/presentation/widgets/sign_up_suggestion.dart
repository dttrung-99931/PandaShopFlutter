import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_step1_screen.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpSuggestion extends StatelessWidget {
  const SignUpSuggestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(endIndent: 24, color: EVMColors.blackLight)),
            Text(
              'はじめての方はこちら',
              style: textTheme.bodyMedium?.copyWith(color: EVMColors.blackLight),
            ),
            const Expanded(child: Divider(indent: 24, color: EVMColors.blackLight)),
          ],
        ),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {
            Global.navigator.pushNamed(SignUpStep1Screen.router);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: EVMColors.blackLight), borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
          child: Text('Eviアカウント新規登録', style: textTheme.bodyMedium?.copyWith(color: EVMColors.blackLight)),
        ),
      ],
    );
  }
}
