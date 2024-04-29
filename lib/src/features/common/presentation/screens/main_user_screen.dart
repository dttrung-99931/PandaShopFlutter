// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/user/main_user_nav_bar.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:evievm_app/src/features/notification/presentation/screens/notification_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/keep_page_alive.dart';
import 'package:evievm_app/src/shared/widgets/common/refresh_widget.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({Key? key}) : super(key: key);

  @override
  State<MainUserScreen> createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  late PageController _pageController;
  ValueNotifier<int> get _currentPageIndex => Global.mainPageIndexNotifier;
  late final _homeScrollController = ScrollController();
  late final _notiScrollController = ScrollController();
  late final _accountScrollController = ScrollController();
  ScrollController get _scrollController {
    switch (_currentPageIndex.value) {
      case 0:
        return _homeScrollController;
      case 1:
        return _notiScrollController;
      case 2:
        return _accountScrollController;
      default:
        throw 'Invalid tab index';
    }
  }

  @override
  void initState() {
    loginBloc.add(OnDoCheckLogin(onDidLogin: () {
      userBloc.add(OnGetUserDetail());
    }));
    _pageController = PageController();
    _currentPageIndex.addListener(() {
      if (_pageController.hasClients && mounted) {
        _pageController.jumpToPage(_currentPageIndex.value);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshParentWidget(
        child: PageView.builder(
          onPageChanged: (index) {
            _currentPageIndex.value = index;
          },
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => HomeScreen(scrollController: _homeScrollController),
                  ),
                );
              case 1:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              case 2:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => const AccountScreen(),
                  ),
                );
              default:
            }

            throw 'Page number not match';
          },
        ),
      ),
      bottomNavigationBar: HiddenOnSrollWidget(
        scrollController: _scrollController,
        height: 72.h,
        child: MainUserBottomNavBar(selectedIndexNotifier: _currentPageIndex),
      ),
    );
  }
}
