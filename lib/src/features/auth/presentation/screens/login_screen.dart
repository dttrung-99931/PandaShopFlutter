// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/app_custom_checkbox.dart';
import 'package:evievm_app/src/shared/widgets/common/triangle_clip_path.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/custom_bloc_consumer.dart';
import '../../../../shared/widgets/custom_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  static const router = '/login';

  const LoginScreen({super.key});

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
                        controller: loginBloc.passwordEdtController,
                        isPasswordInput: true,
                        textInputAction: TextInputAction.done,
                        onSubmited: (_) {
                          _onLoginButtonPressed();
                        },
                      ),
                      6.shb,
                      const _RememberPhoneCheckBox(),
                      4.shb,
                      const _LoginButton(),
                      TextButton(
                        onPressed: commingSoon,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 12.w,
                          ),
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          tr('Quên mật khẩu'),
                          style: textTheme.bodyLarge.withColor(
                            AppColors.primary.shade300,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Global.pushReplacementNamed(SignUpScreen.router);
                        },
                        child: Text(
                          tr('Đăng ký'),
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

_onLoginButtonPressed() {
  loginBloc.add(
    OnLogin(
      loginBloc.phoneEdtController.text,
      loginBloc.passwordEdtController.text,
      loginBloc.rememberPhoneController.value,
    ),
  );
}

class _RememberPhoneCheckBox extends StatelessWidget {
  const _RememberPhoneCheckBox();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: loginBloc.rememberPhoneController,
        builder: (context, widget) {
          return AppCustomCheckBox(
            onChanged: (bool isChecked) {
              loginBloc.rememberPhoneController.value = isChecked;
            },
            isChecked: loginBloc.rememberPhoneController.value,
            title: 'Nhớ số điện thoại',
          );
        });
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<LoginBloc>(
      initialEvent: OnGetRememberLoginEmail(),
      listenForStates: const [GetRememberLoginEmailSuccess],
      listener: (state) {
        if (state is GetRememberLoginEmailSuccess && (state.email ?? '').isNotEmpty) {
          loginBloc.phoneEdtController.text = state.email!;
          loginBloc.rememberPhoneController.value = true;
        }
      },
      child: TextInput(
        hintText: 'Số điện thoại',
        controller: loginBloc.phoneEdtController,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<LoginBloc>(
      handleLoading: false,
      buildForStates: const [LoginSuccess, LoginFailed, ErrorState, LoadingState],
      listenForStates: const [LoginSuccess],
      listener: (state) {
        if (state is LoginSuccess) {
          onLoginSuccess();
        }
      },
      builder: (state) {
        return CustomButton(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          onPressed: _onLoginButtonPressed,
          title: 'Đăng nhập',
          elevation: 0,
          isLoading: state is LoadingState,
        );
      },
    );
  }
}

Future<Object?> onLoginSuccess() => Global.popAllAndPushNamed(MainScreen.router);

class _LoginFailedText extends StatelessWidget {
  const _LoginFailedText();

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<LoginBloc>(
      // Listen GetRememberLoginEmailSuccess to clear error message if there's error from scanner login screen
      buildForStates: const [LoginFailed, GetRememberLoginEmailSuccess],
      handleLoading: false,
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
