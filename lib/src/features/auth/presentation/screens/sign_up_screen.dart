// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/triangle_clip_path.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/custom_bloc_consumer.dart';

class SignUpScreen extends StatelessWidget {
  static const router = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: Stack(
        children: [
          const _Background(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: .15.sw),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'PanShop',
                        style: textTheme.titleLarge
                            .withColor(context.isKeyboardShowing ? AppColors.black : AppColors.primary)
                            .withSize(40.sp),
                      ),
                      52.shb,
                      const _PhoneInput(),
                      16.shb,
                      TextInput(
                        hintText: 'Mật khẩu',
                        controller: signUpBloc.passwordEdtController,
                        passwordChar: true,
                        textInputAction: TextInputAction.done,
                        onSubmited: (_) {
                          _onSignUpButtonPressed();
                        },
                      ),
                      16.shb,
                      TextInput(
                        hintText: 'Nhập lại mật khẩu',
                        controller: signUpBloc.passwordConfirmEdtController,
                        passwordChar: true,
                        textInputAction: TextInputAction.done,
                        onSubmited: (_) {
                          _onSignUpButtonPressed();
                        },
                      ),
                      20.shb,
                      const _SignUpButton(),
                      TextButton(
                        onPressed: () {
                          Global.pushReplacementNamed(LoginScreen.router);
                        },
                        child: Text(
                          tr('Đăng nhập'),
                          style: textTheme.titleSmall.withColor(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_onSignUpButtonPressed() {
  signUpBloc.add(
    OnSignUp(
      signUpBloc.phoneEdtController.text,
      signUpBloc.passwordEdtController.text,
    ),
  );
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: 'Số điện thoại',
      controller: signUpBloc.phoneEdtController,
      textInputType: TextInputType.phone,
      textInputAction: TextInputAction.next,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<SignUpBloc>(
      handleLoading: false,
      buildForStates: const [LoginSuccess, LoginFailed, ErrorState, LoadingState],
      listenForStates: const [LoginSuccess],
      listener: (state) {
        if (state is LoginSuccess) {
          Global.popAllAndPushNamed(MainScreen.router);
        }
      },
      builder: (state) {
        return CustomButton(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          onPressed: _onSignUpButtonPressed,
          title: 'Đăng ký',
          elevation: 0,
          isLoading: state is LoadingState,
        );
      },
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
              clipper: TriangleClipPath(),
              child: Container(
                height: 128,
                color: AppColors.primary,
              ),
            ),
            // 16.shb,
            // Text(
            //   'PanShop',
            //   style: textTheme.titleLarge.withColor(AppColors.primary).withSize(40.sp),
            // ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RotatedBox(
            quarterTurns: 2,
            child: ClipPath(
              clipper: TriangleClipPath(),
              child: Container(
                height: 128,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
