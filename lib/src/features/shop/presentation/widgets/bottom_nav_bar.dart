// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../shared/widgets/card_icon.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    Key? key,
    required this.selectedIndexNotifier,
  }) : super(key: key);
  final ValueNotifier<int> selectedIndexNotifier;
  int get _selectIndex => selectedIndexNotifier.value;
  set _selectIndex(value) => selectedIndexNotifier.value = value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (_, __, ___) {
              return BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: CardIcon(Icons.home_outlined),
                    label: "Trang chủ",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: CardIcon(Icons.shop_outlined),
                    label: "Bán hàng",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: CardIcon(Icons.notifications_outlined),
                    label: "Thông báo",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: CardIcon(Icons.account_box_outlined),
                    label: "Tài khoản",
                  ),
                ],
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.black.withOpacity(0.8),
                showUnselectedLabels: true,
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
  }
}