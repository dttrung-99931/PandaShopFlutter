// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/badge.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../shared/widgets/card_icon.dart';

class MainShopBottomNavBar extends StatelessWidget {
  const MainShopBottomNavBar({
    super.key,
    required this.selectedIndexNotifier,
  });
  final ValueNotifier<int> selectedIndexNotifier;
  int get _selectIndex => selectedIndexNotifier.value;
  set _selectIndex(value) => selectedIndexNotifier.value = value;

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<UserBloc>(
        buildForStates: const [GetUserDetailSuccess],
        handleLoading: false,
        builder: (state) {
          // Show main bottom app bar only after GetUserDetailSuccess
          return Stack(
            children: [
              ValueListenableBuilder(
                  valueListenable: selectedIndexNotifier,
                  builder: (_, __, ___) {
                    return Theme(
                      data: ThemeData(
                        // Disable ripple anim on press
                        splashColor: AppColors.transparent,
                      ),
                      child: BottomNavigationBar(
                        backgroundColor: AppColors.white,
                        items: [
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: CardIcon.zeroPadding(Icons.shop_outlined),
                            label: "Cửa hàng",
                          ),
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: CardIcon.zeroPadding(Icons.menu_book_outlined),
                            label: "Đơn hàng",
                          ),
                          const BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: NotiIconWithBadge(),
                            label: "Thông báo",
                          ),
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: CardIcon.zeroPadding(Icons.account_box_outlined),
                            label: "Tài khoản",
                          ),
                        ],
                        selectedItemColor: AppColors.primaryShop,
                        unselectedItemColor: AppColors.black.withOpacity(0.8),
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _selectIndex,
                        onTap: (index) {
                          _selectIndex = index;
                        },
                        iconSize: 28.r,
                        selectedFontSize: 12,
                        unselectedFontSize: 12,
                        elevation: 10,
                      ).skeleton(state is LoadingState, context),
                    );
                  }),
              // Make shadow
              Container(
                height: 1.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 1.r, offset: const Offset(2, 0), color: AppColors.grey.withOpacity(0.4)),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class NotiIconWithBadge extends StatefulWidget {
  const NotiIconWithBadge({
    super.key,
  });

  @override
  State<NotiIconWithBadge> createState() => _NotiIconWithBadgeState();
}

class _NotiIconWithBadgeState extends State<NotiIconWithBadge> {
  @override
  void initState() {
    doIfLoggedIn(() {
      notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        CardIcon.zeroPadding(Icons.notifications_outlined),
        Positioned(
          right: -8.w,
          top: 2.h,
          child: CustomBlocBuilder<NotificationBloc>(
            handleLoading: false,
            buildForStates: const [GetNotificationOverviewSuccesss],
            builder: (state) {
              if (state is! GetNotificationOverviewSuccesss || state.data.newNotiNum == 0) {
                return emptyWidget;
              }
              return AppBadge(number: state.data.newNotiNum);
            },
          ),
        )
      ],
    );
  }
}
