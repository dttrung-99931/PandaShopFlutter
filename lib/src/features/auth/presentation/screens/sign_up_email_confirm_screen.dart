import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_success_email_confirm_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/back_to_email_login_screen_button.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

class SignUpEmailConfirmScreen extends StatelessWidget {
  static const router = '/signUpEmailConfirm';
  final _emailEdtController = TextEditingController();
  SignUpEmailConfirmScreen({Key? key}) : super(key: key);

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
                  // TODO: Listen going to email confirm success screen when users click url in confirm emails
                  // && remove GestureDetector
                  GestureDetector(
                    onTap: () {
                      Global.navigator.pushNamed(
                        SignUpSuccessEmailConfirmScreen.router,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 40, 40, 32),
                      decoration: BoxDecoration(
                        border: Border.all(color: EVMColors.border),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            tr('auth.please_check_your_email'),
                            style: textTheme.bodyMedium?.copyWith(fontSize: 17),
                          ),
                          const SizedBox(height: 32.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              tr('auth.login_not_completed_click_link_in_your_mail'),
                              style: textTheme.bodySmall?.copyWith(color: EVMColors.blackLight.withOpacity(.5)),
                            ),
                          ),
                          const SizedBox(height: 56.0),
                          Text(
                            tr('auth.if_you_doesnt_receive_mail_check_again'),
                            style: textTheme.bodySmall?.copyWith(color: EVMColors.blackLight.withOpacity(.5)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32.0),
                          TextInput(hintText: 'auth.email', controller: _emailEdtController),
                          const SizedBox(height: 24.0),
                          CustomButton(
                            width: double.infinity,
                            onPressed: () {},
                            title: 'auth.resend_confirm_email',
                            elevation: 0,
                          ),
                        ],
                      ),
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
