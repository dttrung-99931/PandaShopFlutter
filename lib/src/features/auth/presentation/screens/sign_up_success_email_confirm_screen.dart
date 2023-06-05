import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/back_to_email_login_screen_button.dart';

class SignUpSuccessEmailConfirmScreen extends StatelessWidget {
  static const router = '/signUpSuccessEmailConfirm';
  const SignUpSuccessEmailConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: context.width * .24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SignUpHeader(titleStyle: textTheme.titleLarge, translateX: -16),
                  const SizedBox(height: 36.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 32),
                    decoration: BoxDecoration(
                      border: Border.all(color: EVMColors.border),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          tr('auth.register_email_complete'),
                          style: textTheme.bodyMedium?.copyWith(fontSize: 17),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          tr('auth.email_confirmed_next_select_register_lab'),
                          style: textTheme.bodySmall?.copyWith(color: EVMColors.blackLight.withOpacity(.5)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 128.0),
                        CustomButton(
                          width: double.infinity,
                          onPressed: () {},
                          title: 'auth.select_lab',
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const BackToEmailLoginScreenButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
