// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/common/unregister_widget.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    loginBloc.add(OnCheckLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 240.h,
          color: AppColors.primary,
        ),
        Positioned.fill(
          top: 160.h,
          child: Column(
            children: [
              const _Avatar(),
              Expanded(
                child: CustomBlocBuilder<LoginBloc>(
                  buildForStates: const [CheckLoginSuccess],
                  builder: (state) {
                    if (state is! CheckLoginSuccess) {
                      return emptyWidget;
                    }
                    return state.isLoggedIn
                        ? const Center(
                            child: SingleChildScrollView(
                              child: _Items(),
                            ),
                          )
                        : const NotLoginWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnregisterWidget(
      title: 'Bạn chưa đăng nhập!',
      buttonTitle: 'Đăng nhập',
      onPressed: () {
        Global.pushNamed(LoginScreen.router);
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3.r),
      ),
      child: CircleAvatar(
        maxRadius: 76.r,
        backgroundColor: AppColors.blueGreyLight,
      ),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomBlocBuilder<UserBloc>(
          buildForStates: const [GetUserDetailSuccess],
          builder: (state) {
            if (state is! GetUserDetailSuccess) {
              return emptyWidget;
            }
            return _Item(
              title: state.data.shop != null ? 'Chuyển qua shop' : 'Tạo shop của bạn',
              onPressed: () {
                if (state.data.shop != null) {
                  // TODO:
                } else {
                  Global.mainPageIndexNotifier.value = 1; // Switch to shop page on main screen
                }
              },
              icon: const Icon(Icons.home_outlined),
            );
          },
        ),
        const _Item(
          title: 'Thông tin',
          onPressed: commingSoon,
          icon: Icon(Icons.info_outlined),
        ),
        const _Item(
          title: 'Cài đặt',
          onPressed: commingSoon,
          icon: Icon(Icons.settings_outlined),
        ),
        _Item(
          title: 'Đăng xuất',
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AppAlertDialog(
                title: 'Xác nhận đăng xuất?',
                width: 360.w,
                confirmLabel: 'Xác nhận',
                onConfirm: () {
                  loginBloc.add(OnLogout());
                },
              ),
            );
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Widget icon;
  const _Item({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
          child: SpacingRow(
            spacing: 16.w,
            children: [
              icon,
              Expanded(child: Text(title, style: textTheme.titleSmall)),
              const Icon(Icons.chevron_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
