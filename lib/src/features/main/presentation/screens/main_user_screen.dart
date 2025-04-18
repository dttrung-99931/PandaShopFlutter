// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/user/main_user_nav_bar.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/screens/notification_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/panvideos_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/keep_page_alive.dart';
import 'package:evievm_app/src/shared/widgets/common/refresh_widget.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({super.key});

  @override
  State<MainUserScreen> createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  late PageController _pageController;
  ValueNotifier<int> get _currentPageIndex => Global.mainPageIndexNotifier;
  late final _homeScrollController = ScrollController();
  late final _notiScrollController = ScrollController();
  late final _panvideosScrollController = ScrollController();
  late final _accountScrollController = ScrollController();
  ScrollController get _scrollController {
    switch (_currentPageIndex.value) {
      case 0:
        return _homeScrollController;
      case 1:
        return _panvideosScrollController;
      case 2:
        return _notiScrollController;
      case 3:
        return _accountScrollController;
      default:
        throw 'Invalid tab index';
    }
  }

  @override
  void initState() {
    doIfLoggedIn(() {
      userBloc.add(OnGetUserDetail());
    });
    _pageController = PageController();
    _currentPageIndex.addListener(_onPageIndexChanged);

    doIfLoggedIn(() {
      notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
    });

    super.initState();
  }

  void _onPageIndexChanged() {
    if (_pageController.hasClients && mounted) {
      _pageController.jumpToPage(_currentPageIndex.value);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _homeScrollController.dispose();
    _notiScrollController.dispose();
    _panvideosScrollController.dispose();
    _accountScrollController.dispose();
    _currentPageIndex.removeListener(_onPageIndexChanged);
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
          itemCount: 4,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => HomeScreen(scrollController: _homeScrollController),
                  ),
                );
              case 1:
                return RefreshChildBuilder(
                  builder: (_) => PanvideosScreen(scrollController: _panvideosScrollController),
                );
              case 2:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              case 3:
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
        child: MainUserBottomNavBar(selectedIndexNotifier: _currentPageIndex),
      ),
    );
  }
}
