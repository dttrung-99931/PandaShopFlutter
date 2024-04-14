// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_session.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulOrderScreen extends StatefulWidget {
  static const String router = '/successfulOrder';
  const SuccessfulOrderScreen({super.key});

  @override
  State<SuccessfulOrderScreen> createState() => _SuccessfulOrderScreenState();
}

class _SuccessfulOrderScreenState extends State<SuccessfulOrderScreen> {
  @override
  void initState() {
    super.initState();
    loginBloc.add(OnCheckLogin());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Global.popAllAndPushNamed(MainScreen.router);
        return false;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 56.h,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Global.popAllAndPushNamed(MainScreen.router);
                },
                icon: const Icon(Icons.home),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: 240.h,
                    color: AppColors.primary,
                  ),
                  Positioned.fill(
                    child: Column(
                      children: [
                        24.shb,
                        const _SuccessTick(),
                        16.shb,
                        Text(
                          'Đặt hàng thành công',
                          style: textTheme.titleMedium.withColor(AppColors.white).withWeight(FontWeight.w500),
                        ),
                        8.shb,
                        Text(
                          'Tình trạng đơn hàng sẽ được thông báo đén bạn. \nHãy theo dõi app nhé!',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge
                              .withColor(AppColors.white.withOpacity(.7))
                              .withWeight(FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverSection(
              title: 'Có thể bạn quan tâm',
              child: emptyWidget,
            ),
            ProductSliverGridBlocBuilder<HomeBloc>(
              inititalEvent: OnGetHomeProducts(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessTick extends StatelessWidget {
  const _SuccessTick();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3.r),
      ),
      child: Icon(Icons.check, color: AppColors.green2, size: 56.r),
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
