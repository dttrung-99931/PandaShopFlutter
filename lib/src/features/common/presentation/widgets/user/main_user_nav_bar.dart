// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/shop/main_shop_nav_bar.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../shared/widgets/card_icon.dart';

class MainUserBottomNavBar extends StatelessWidget {
  const MainUserBottomNavBar({
    super.key,
    required this.selectedIndexNotifier,
  });
  static int panVideoIndex = 1;
  final ValueNotifier<int> selectedIndexNotifier;
  int get _selectIndex => selectedIndexNotifier.value;
  set _selectIndex(value) => selectedIndexNotifier.value = value;

  Color get backgroundColor {
    return _selectIndex != panVideoIndex ? AppColors.white : AppColors.black;
  }

  Color get unselectedItemColor {
    return _selectIndex != panVideoIndex ? AppColors.black : AppColors.white;
  }

  Color get iconBackgroundColor {
    return _selectIndex != panVideoIndex ? AppColors.white : AppColors.transparent;
  }

  Color get iconColor {
    return _selectIndex != panVideoIndex ? AppColors.black : AppColors.white;
  }

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
                      backgroundColor: backgroundColor,
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: unselectedItemColor,
                      selectedIconTheme: Theme.of(context).iconTheme.copyWith(color: AppColors.primary),
                      unselectedIconTheme: Theme.of(context).iconTheme.copyWith(color: iconColor),
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
                      items: [
                        BottomNavigationBarItem(
                          backgroundColor: backgroundColor,
                          icon: CardIcon.zeroPadding(
                            Icons.home_outlined,
                            backgroundColor: backgroundColor,
                          ),
                          label: "Trang chủ",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: backgroundColor,
                          icon: CardIcon.zeroPadding(
                            Icons.movie_outlined,
                            backgroundColor: backgroundColor,
                          ),
                          label: "Panvideo",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: backgroundColor,
                          icon: NotiIconWithBadge(
                            backgroundColor: iconBackgroundColor,
                          ),
                          label: "Thông báo",
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: backgroundColor,
                          icon: CardIcon.zeroPadding(
                            Icons.account_box_outlined,
                            backgroundColor: backgroundColor,
                          ),
                          label: "Tài khoản",
                        ),
                      ],
                    ).skeleton(state is LoadingState, context, textLongLevel: TextLongLevel.short),
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
      },
    );
  }
}
