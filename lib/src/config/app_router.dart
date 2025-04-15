import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:evievm_app/src/features/main/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/splash_screen.dart';
import 'package:evievm_app/src/features/order/presentation/screens/order_screen.dart';
import 'package:evievm_app/src/features/order/presentation/screens/successful_order_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/create_panvideo_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/my_panvideos_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/product_inventory_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/register_shop_screen.dart';
import 'package:evievm_app/src/features/shop/presentation/screens/shop_product_detail_screen.dart';
import 'package:evievm_app/src/features/shopping_cart/presentation/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String get initialRouter => MainScreen.router;

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
      case SuccessfulOrderScreen.router:
        return const SuccessfulOrderScreen();

      // Shop
      case ShopProductDetailScreen.router:
        return ShopProductDetailScreen(settings.arguments as dynamic);
      case RegisterShopScreen.router:
        return const RegisterShopScreen();
      case ProductInventoryScreen.router:
        return ProductInventoryScreen(settings.arguments as dynamic);

      // Panvideo
      case CreatePanvideoScreen.router:
        return const CreatePanvideoScreen();
      case EditPanvideoScreen.router:
        return EditPanvideoScreen(settings.arguments as dynamic);
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
