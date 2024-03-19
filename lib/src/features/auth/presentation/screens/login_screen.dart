// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/custom_bloc_consumer.dart';
import '../../../../shared/widgets/custom_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  static const router = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: _CustomClipPath(),
            child: Container(
              height: 128,
              color: AppColors.primary,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: _CustomClipPath(),
                child: Container(
                  height: 128,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: .15.sw),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                            loginBloc.phoneEdtController.text = state.email!;
                            loginBloc.rememberPhoneController.value = true;
                          }
                        },
                        child: TextInput(
                          hintText: 'Số điện thoại',
                          controller: loginBloc.phoneEdtController,
                          textInputType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextInput(hintText: 'Mật khẩu', controller: loginBloc.passwordEdtController, passwordChar: true),
                      const SizedBox(height: 6.0),
                      AnimatedBuilder(
                          animation: loginBloc.rememberPhoneController,
                          builder: (context, widget) {
                            return _RememberPhoneCheckBox(
                              onChanged: (bool isChecked) {
                                loginBloc.rememberPhoneController.value = isChecked;
                              },
                              isChecked: loginBloc.rememberPhoneController.value,
                            );
                          }),
                      const SizedBox(height: 4.0),
                      CustomBlocConsumer<LoginBloc>(
                        handleLoading: false,
                        buildForStates: const [LoginSuccess, LoginFailed, ErrorState, LoadingState],
                        listenForStates: const [LoginSuccess],
                        listener: (state) {
                          if (state is LoginSuccess) {
                            Global.navigator.pushReplacementNamed(HomeScreen.router);
                          }
                        },
                        builder: (state) {
                          return CustomButton(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            onPressed: () {
                              getIt<LoginBloc>().add(
                                OnLogin(
                                  loginBloc.phoneEdtController.text,
                                  loginBloc.passwordEdtController.text,
                                  loginBloc.rememberPhoneController.value,
                                ),
                              );
                            },
                            title: 'Đăng nhập',
                            elevation: 0,
                            isLoading: state is LoadingState,
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(tr('Quên mật khẩu')),
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

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}

class _RememberPhoneCheckBox extends StatelessWidget {
  final void Function(bool isChecked) onChanged;
  final bool isChecked;
  const _RememberPhoneCheckBox({
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
                side: BorderSide(color: AppColors.border, width: 1),
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                value: isChecked,
                onChanged: (isChecked) {
                  onChanged(isChecked ?? false);
                },
              ),
            ),
            Text(
              tr('Nhớ số điện thoại'),
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
