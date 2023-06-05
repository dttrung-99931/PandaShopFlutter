// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/qr_barcode_reader_login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_suggestion.dart';
import 'package:evievm_app/src/features/top/presentation/screens/top_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';

import '../../../../config/app_config.dart';
import '../../../../shared/widgets/custom_bloc_consumer.dart';
import '../../../../shared/widgets/custom_bloc_listener.dart';
import '../../../../shared/widgets/question_mark.dart';

class EmailLoginScreen extends StatelessWidget {
  static const router = '/emailLogin';
  final _emailEdtController = TextEditingController(
    text: AppConfig.config.isDevelopmentDebug ? 'testsouma02@gmail.com' : null,
  );
  final _passwordEdtController = TextEditingController(
    text: AppConfig.config.isDevelopmentDebug ? 'Aa123456' : null,
  );
  final _rememberLoginEmail = ValueNotifier<bool>(false);

  EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: context.width * .28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.img.evmLogo,
                    color: EVMColors.primary,
                  ),
                  const SizedBox(height: 36.0),
                  const _LoginByEviAccountDirection(),
                  SizedBox(height: 8.h),
                  CustomBlocBuilder<LoginBloc>(
                    // Listen GetRememberLoginEmailSuccess to clear error message if there's error from scanner login screen
                    buildForStates: const [LoginFailed, GetRememberLoginEmailSuccess],
                    builder: (state) {
                      return AnimatedSize(
                        duration: 300.milliseconds,
                        child: state is LoginFailed
                            ? Text(
                                state.failure.displayMsg,
                                style: textTheme.bodyMedium!.copyWith(color: EVMColors.red),
                              )
                            : const SizedBox.shrink(),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomBlocListener<LoginBloc>(
                    initialEvent: OnGetRememberLoginEmail(),
                    listenForStates: const [GetRememberLoginEmailSuccess],
                    listener: (state) {
                      if (state is GetRememberLoginEmailSuccess && (state.email ?? '').isNotEmpty) {
                        _emailEdtController.text = state.email!;
                        _rememberLoginEmail.value = true;
                      }
                    },
                    child: TextInput(hintText: 'auth.email', controller: _emailEdtController),
                  ),
                  const SizedBox(height: 16.0),
                  TextInput(hintText: 'auth.password', controller: _passwordEdtController, passwordChar: true),
                  const SizedBox(height: 6.0),
                  AnimatedBuilder(
                      animation: _rememberLoginEmail,
                      builder: (context, widget) {
                        return _RememberEmailCheckBox(
                          onChanged: (bool isChecked) {
                            _rememberLoginEmail.value = isChecked;
                          },
                          isChecked: _rememberLoginEmail.value,
                        );
                      }),
                  const SizedBox(height: 4.0),
                  CustomBlocConsumer<LoginBloc>(
                      handleLoading: false,
                      buildAndListenForStates: const [LoginSuccess, LoginFailed, ErrorState, LoadingState],
                      listener: (state) {
                        if (state is LoginSuccess) {
                          Global.navigator.pushReplacementNamed(TopScreen.router);
                        }
                      },
                      builder: (state) {
                        return CustomButton(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          onPressed: () {
                            getIt<LoginBloc>().add(
                              OnEmailLogin(
                                _emailEdtController.text,
                                _passwordEdtController.text,
                                _rememberLoginEmail.value,
                              ),
                            );
                          },
                          title: 'auth.login',
                          elevation: 0,
                          isLoading: state is LoadingState,
                        );
                      }),
                  TextButton(
                    onPressed: () {},
                    child: Text(tr('auth.forget_password')),
                  ),
                  TextButton(
                    onPressed: () {
                      Global.navigator.pushReplacementNamed(QrBarcodeReaderLoginScreen.router);
                    },
                    child: Text(tr('auth.login_by_qr2')),
                  ),
                  const SizedBox(height: 20.0),
                  const SignUpSuggestion(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginByEviAccountDirection extends StatelessWidget {
  const _LoginByEviAccountDirection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(40.w, 0),
          child: Text(
            tr('auth.login_by_evi_account'),
            style: textTheme.bodyLarge?.light(),
          ),
        ),
        sw(60.w),
        QuestionMark(
          'auth.login_guide',
          width: 40.w,
          translateOffset: Offset(-12.w, 40.h),
        ),
      ],
    );
  }
}

class _RememberEmailCheckBox extends StatelessWidget {
  final void Function(bool isChecked) onChanged;
  final bool isChecked;
  const _RememberEmailCheckBox({
    Key? key,
    required this.onChanged,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Transform.translate(
        offset: const Offset(-8, 0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: EVMColors.border, width: 1),
                fillColor: MaterialStateColor.resolveWith((states) => EVMColors.primary),
                value: isChecked,
                onChanged: (isChecked) {
                  onChanged(isChecked ?? false);
                },
              ),
            ),
            Text(
              tr('auth.ignore_enter_email_again'),
              style: textTheme.bodyMedium?.light(),
            ),
          ],
        ),
      ),
    );
  }
}
