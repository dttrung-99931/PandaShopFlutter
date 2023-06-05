import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_email_confirm_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/back_to_email_login_screen_button.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_steps.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';

class SignUpStep1Screen extends StatelessWidget {
  static const router = '/signUpStep1';
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  SignUpStep1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: Dimensions.signUpPadding(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SignUpHeader(translateX: -40),
                  const SizedBox(height: 40.0),
                  const SignUpSteps(marginLeft: 88),
                  const SizedBox(height: 48.0),
                  InfoInput(
                    title: 'auth.full_name',
                    controller: _firstNameController,
                    secondController: _lastNameController,
                  ),
                  InfoInput(
                    title: 'auth.email',
                    controller: _emailController,
                  ),
                  InfoInput(
                    title: 'auth.password',
                    controller: _passwordController,
                    bottomTextInputLabel: 'auth.password_contraints',
                  ),
                  InfoInput(
                    title: 'auth.confirm_password',
                    controller: _passwordConfirmController,
                    showBottomDivider: true,
                  ),
                  Row(
                    children: [
                      const ExpandedSizedBox(flex: 5),
                      Expanded(
                        flex: 14,
                        child: Column(
                          children: [
                            CustomButton(
                              margin: const EdgeInsets.symmetric(vertical: 12.0),
                              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 160),
                              onPressed: () {
                                Global.navigator.pushNamed(
                                  SignUpEmailConfirmScreen.router,
                                );
                              },
                              title: 'auth.register',
                              elevation: 0,
                            ),
                            const SizedBox(height: 4.0),
                            const BackToEmailLoginScreenButton(),
                          ],
                        ),
                      ),
                      const ExpandedSizedBox(flex: 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
