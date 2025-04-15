// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/account_screen.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widgets/shop/main_shop_nav_bar.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/screens/notification_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/my_panvideos_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_order_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/keep_page_alive.dart';
import 'package:evievm_app/src/shared/widgets/common/refresh_widget.dart';
import 'package:evievm_app/src/shared/widgets/hidden_on_scroll_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class MainShopScreen extends StatefulWidget {
  const MainShopScreen({super.key});

  @override
  State<MainShopScreen> createState() => _MainShopScreenState();
}

class _MainShopScreenState extends AutoResetBlocState<MainShopScreen, UserBloc> {
  late PageController _pageController;
  ValueNotifier<int> get _currentPageIndex => Global.mainPageIndexNotifier;
  late final _shopScrollController = ScrollController();
  late final _notiScrollController = ScrollController();
  late final _accountScrollController = ScrollController();
  late final _panVideoController = ScrollController();

  ScrollController get _scrollController {
    switch (_currentPageIndex.value) {
      case 0:
      case 1:
      case 3:
      case 4:
        return _shopScrollController;
      case 2:
        return _panVideoController;
      default:
        throw 'Invalid tab index';
    }
  }

  @override
  void initState() {
    doIfLoggedIn(() {
      userBloc.add(OnGetUserDetail());
      notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
    });
    _pageController = PageController();
    _currentPageIndex.addListener(_onPageChanged);
    super.initState();
  }

  void _onPageChanged() {
    if (!_pageController.hasClients || !mounted) {
      return;
    }
    final currentPageIdx = _currentPageIndex.value;
    _pageController.jumpToPage(currentPageIdx);
    // UIUtils.changeUIMode(
    //   currentPageIdx == MainShopBottomNavBar.panVideoIndex ? UIMode.fullScreen : UIMode.normal,
    // );
  }

  @override
  void dispose() {
    _shopScrollController.dispose();
    _notiScrollController.dispose();
    _accountScrollController.dispose();
    _panVideoController.dispose();
    _pageController.dispose();
    _currentPageIndex.removeListener(_onPageChanged);
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
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => ShopScreen(scrollController: _shopScrollController),
                  ),
                );
              case 1:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => const ShopOrderScreen(),
                  ),
                );
              case 2:
                return RefreshChildBuilder(
                  builder: (_) => MyPanvideosScreen(
                    scrollController: _panVideoController,
                  ),
                );
              case 3:
                return KeepAlivePage(
                  child: RefreshChildBuilder(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              case 4:
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
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPageIndex,
        builder: (_, __, ___) => HiddenOnSrollWidget(
          scrollController: _scrollController,
          child: MainShopBottomNavBar(selectedIndexNotifier: _currentPageIndex),
        ),
      ),
    );
  }
}
