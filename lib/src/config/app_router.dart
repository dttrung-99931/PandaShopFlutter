import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/splash_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/order_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/shopping_cart_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/register_shop_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String get initialRouter => SplashScreen.router;

  static Widget _buildScreen(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      // Common
      case SplashScreen.router:
        return const SplashScreen();

      // Auth
      case LoginScreen.router:
        return const LoginScreen();
      case SignUpScreen.router:
        return const SignUpScreen();

      // Main
      case MainScreen.router:
        return const MainScreen();

      // Shopping cart
      case ShoppingCartScreen.router:
        return const ShoppingCartScreen();

      // Products
      case SearchProductsScreen.router:
        return const SearchProductsScreen();
      case ProductDetailScreen.router:
        return ProductDetailScreen(settings.arguments as ProductDetailScreenArgs);
      case OrderScreen.router:
        return OrderScreen(settings.arguments as dynamic);

      // Shop
      case ShopProductDetailScreen.router:
        return ShopProductDetailScreen(settings.arguments as dynamic);
      case RegisterShopScreen.router:
        return const RegisterShopScreen();
    }
    return const SizedBox.shrink();
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    _configUIForScreen(settings);
    _initLazyBloc(settings);
    return MaterialPageRoute(
      builder: (context) {
        return _buildScreen(settings, context);
      },
      settings: settings,
    );
  }

  static void _configUIForScreen(RouteSettings settings) {
    if (![MainScreen.router].contains(settings.name)) {
      // Hide status bar
      // TODO: do not hide system nav bar
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      // SystemChrome.setSystemUIOverlayStyle(
      //   const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
      // );
    } else {
      // Show status bar again
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // SystemChrome.setSystemUIOverlayStyle(
      //   const SystemUiOverlayStyle(statusBarColor: EVMColors.blueGreyDark, statusBarBrightness: Brightness.light),
      // );
    }
  }

  static void _initLazyBloc(RouteSettings settings) {
    switch (settings.name) {
      // case ProcessSelectionScreen.router:
      //   getIt<CreateTaskBloc>(); // get to init lazy singleton bloc
      //   break;
      default:
    }
  }
}
