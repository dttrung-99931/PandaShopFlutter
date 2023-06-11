import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/email_login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/qr_barcode_reader_login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_email_confirm_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_payment_input_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_step1_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_success_email_confirm_screen.dart';
import 'package:evievm_app/src/features/settings/presentation/screens/lab_setting_screen.dart';
import 'package:evievm_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_step2_lab_info_input_screen.dart';
import 'package:evievm_app/src/features/common/presentation/screens/splash_screen.dart';

class AppRouter {
  static String get initialRouter => SplashScreen.router;

  static Widget _buildScreen(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      // Common
      case SplashScreen.router:
        return const SplashScreen();

      // Auth
      case QrBarcodeReaderLoginScreen.router:
        return const QrBarcodeReaderLoginScreen();
      case EmailLoginScreen.router:
        return EmailLoginScreen();
      case SignUpStep1Screen.router:
        return SignUpStep1Screen();
      case SignUpEmailConfirmScreen.router:
        return SignUpEmailConfirmScreen();
      case SignUpSuccessEmailConfirmScreen.router:
        return const SignUpSuccessEmailConfirmScreen();
      case SignUpStep2LabInfoInputScreen.router:
        return SignUpStep2LabInfoInputScreen(settings.arguments as SignUpStep2LabInfoInputScreenArgs);
      case SignUpPaymentInputScreen.router:
        return SignUpPaymentInputScreen();

      // Home
      case HomeScreen.router:
        return HomeScreen();

      // Products
      case SearchProductsScreen.router:
        return const SearchProductsScreen();
      case ProductDetailScreen.router:
        return ProductDetailScreen(settings.arguments as ProductDetailScreenArgs);

      // Settings
      case LabSettingScreen.router:
        return const LabSettingScreen();
    }
    return const SizedBox.shrink();
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    _configUIForScreen(settings);
    _initLazyBloc(settings);
    return MaterialPageRoute(
      builder: (context) => _buildScreen(settings, context),
      settings: settings,
    );
  }

  static void _configUIForScreen(RouteSettings settings) {
    if ([EmailLoginScreen.router, SplashScreen.router].contains(settings.name)) {
      // Hide status bar
      // TODO: do not hide system nav bar
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    } else {
      // Show status bar again
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: EVMColors.blue2, statusBarBrightness: Brightness.light),
      );
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
