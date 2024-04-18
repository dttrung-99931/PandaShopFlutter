// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../shared/widgets/card_icon.dart';

class MainUserBottomNavBar extends StatelessWidget {
  const MainUserBottomNavBar({
    Key? key,
    required this.selectedIndexNotifier,
  }) : super(key: key);
  final ValueNotifier<int> selectedIndexNotifier;
  int get _selectIndex => selectedIndexNotifier.value;
  set _selectIndex(value) => selectedIndexNotifier.value = value;

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<UserBloc>(
        buildForStates: const [GetUserDetailSuccess],
        builder: (state) {
          if (state is LoadingState) {
            return emptyWidget;
          }
          // Show main bottom app bar only after GetUserDetailSuccess
          return Stack(
            children: [
              ValueListenableBuilder(
                  valueListenable: selectedIndexNotifier,
                  builder: (_, __, ___) {
                    return BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                          backgroundColor: Colors.white,
                          icon: CardIcon.zeroPadding(Icons.home_outlined),
                          label: "Trang chủ",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.white,
                          icon: CardIcon.zeroPadding(Icons.notifications_outlined),
                          label: "Thông báo",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.white,
                          icon: CardIcon.zeroPadding(Icons.account_box_outlined),
                          label: "Tài khoản",
                        ),
                      ],
                      selectedItemColor: AppColors.primary,
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
