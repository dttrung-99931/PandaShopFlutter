import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/mixins/theme_mixins.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/email_login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_suggestion.dart';
import 'package:evievm_app/src/features/top/presentation/screens/top_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/scanner_widget.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrBarcodeReaderLoginScreen extends StatefulWidget {
  const QrBarcodeReaderLoginScreen({Key? key}) : super(key: key);

  static const router = '/qrBarcodeReaderLogin';

  @override
  State<QrBarcodeReaderLoginScreen> createState() => _QrBarcodeReaderLoginScreenState();
}

class _QrBarcodeReaderLoginScreenState extends State<QrBarcodeReaderLoginScreen> with TextThemeMixin {
  final qrCameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    formats: [BarcodeFormat.code39, BarcodeFormat.qrCode],
  );
  String code = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                sh(48.h),
                Text(
                  'auth.login_by_qr'.tr(),
                  style: textTheme.bodyLarge!.copyWith(color: EVMColors.primary),
                ),
                Text(
                  'auth.you_can_also_login_by_barcode_reader'.tr(),
                  style: textTheme.bodyMedium,
                ),
                sh(20.h),
                CustomBlocListener<LoginBloc>(
                  listenForStates: const [LoadingState, LoginSuccess, ErrorState],
                  listener: (state) {
                    switch (state.runtimeType) {
                      case LoginSuccess:
                        Global.navigator.pushNamed(TopScreen.router);
                        break;
                      default:
                        qrCameraController.start();
                    }
                  },
                  child: ScannerWidget(
                    cameraController: qrCameraController,
                    onlyUseCamera: false,
                    onDetect: (String barcode) {
                      qrCameraController.stop();
                      getIt<LoginBloc>().add(OnQrBarcodeReaderLogin(scannedCode: barcode));
                    },
                  ),
                ),
                sh(4.h),
                TextButton(
                  onPressed: () {
                    Global.navigator.pushReplacementNamed(EmailLoginScreen.router);
                  },
                  child: Text(tr('auth.login_by_email_pwd')),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: .29.sw),
                  child: const SignUpSuggestion(),
                ),
                sh(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
