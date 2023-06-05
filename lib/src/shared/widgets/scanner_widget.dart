import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'qr_scanner_overlay_shape.dart';

class ScannerWidget extends StatefulWidget {
  final double width;
  final double height;
  final double scanAreaVertRatio;
  final double scanAreaHorzRatio;
  final bool onlyUseCamera;
  final MobileScannerController? cameraController;
  final bool Function(String)? validation;

  ScannerWidget({
    required this.onDetect,
    super.key,
    double? height,
    double? width,
    this.scanAreaVertRatio = 0.6,
    this.scanAreaHorzRatio = 0.68,
    this.onlyUseCamera = true,
    this.cameraController,
    this.validation,
  })  : width = width ?? 520.w,
        height = height ?? 420.h;

  final void Function(String) onDetect;

  @override
  State<ScannerWidget> createState() => ScannerWidgetState();
}

class ScannerWidgetState extends State<ScannerWidget> {
  late final MobileScannerController cameraController;

  String code = '';

  bool isCameraMode = true;
  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool needClearTec = false;

  handleBarcodeScanner(FocusNode node, RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.enter || event.physicalKey == PhysicalKeyboardKey.enter) {
      widget.onDetect(code);
      code = '';
      needClearTec = true;
      return;
    }

    if (event.runtimeType.toString() != 'RawKeyDownEvent') return;

    if (needClearTec) {
      textController.clear();
      needClearTec = false;
    }

    if (isCameraMode) return;

    code += (event.character ?? event.logicalKey.keyLabel);
    textController.text = code;
  }

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    // ]);
    cameraController = widget.cameraController ??
        MobileScannerController(
          detectionSpeed: DetectionSpeed.unrestricted,
          formats: [BarcodeFormat.code39, BarcodeFormat.qrCode],
        );
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          if (isCameraMode)
            _buildCameraScanner(context)
          else
            Platform.isAndroid ? _androidBarcodeReaderWidget() : _iosBarcodeReaderWidget(),
          Positioned(
            top: 16.r,
            left: 16.r,
            right: 16.r,
            child: Row(
              children: [
                if (widget.onlyUseCamera == false)
                  _ChangeModeButton(
                    isCamera: isCameraMode,
                    onTap: () {
                      setState(() {
                        isCameraMode = !isCameraMode;
                      });
                      if (isCameraMode) {
                        cameraController.start();
                      } else {
                        cameraController.stop();
                        if (Platform.isAndroid) focusNode.requestFocus();
                      }
                    },
                  ),
                const Spacer(),
                if (isCameraMode)
                  _FlipCameraButton(
                    onTap: () => cameraController.switchCamera(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraScanner(BuildContext context) {
    double scanAreaWidth = widget.width * widget.scanAreaHorzRatio;
    double scanAreaHeight = widget.height * widget.scanAreaVertRatio;
    Rect scanWindow = Rect.fromCenter(
      center: Offset(widget.height / 2, widget.width / 2),
      width: scanAreaHeight,
      height: scanAreaWidth,
    );

    return Stack(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: RotatedBox(
            quarterTurns: -1,
            child: MobileScanner(
              scanWindow: scanWindow,
              controller: cameraController,
              errorBuilder: (_, exception, ___) => Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: CameraScannerErrorWidget(exception: exception),
                ),
              ),
              onDetect: (capture) {
                for (final barcode in capture.barcodes) {
                  final value = barcode.displayValue;
                  if (value != null && value.isNotEmpty && widget.validation?.call(value) != false) {
                    widget.onDetect(value);
                    HapticFeedback.vibrate();
                  }
                  logd('Barcode found: ${barcode.displayValue} (format: ${barcode.format.name})');
                }
              },
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            shape: QrScannerOverlayShape(
              cutOutWidth: scanAreaWidth,
              cutOutHeight: scanAreaHeight,
              borderColor: EVMColors.white,
              borderWidth: 14.w,
              borderRadius: 12.r,
              borderLength: 20.r,
              overlayColor: EVMColors.bgFlipCamera.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _androidBarcodeReaderWidget() {
    return FocusScope(
      onKey: (node, event) {
        handleBarcodeScanner(node, event);
        return KeyEventResult.handled;
      },
      child: Center(
        child: TextField(
          autofocus: true,
          focusNode: focusNode,
          controller: textController,
          decoration: const InputDecoration(border: InputBorder.none),
          textAlign: TextAlign.center,
          style: textTheme.titleLarge!.arial().bold(),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget _iosBarcodeReaderWidget() {
    return FocusScope(
      canRequestFocus: true,
      autofocus: true,
      onKey: (node, event) {
        handleBarcodeScanner(node, event);
        return KeyEventResult.handled;
      },
      child: Center(
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(border: InputBorder.none),
          textAlign: TextAlign.center,
          style: textTheme.titleLarge!.arial().bold(),
          keyboardType: TextInputType.none,
        ),
      ),
    );
  }
}

class _ChangeModeButton extends StatelessWidget {
  const _ChangeModeButton({Key? key, required this.isCamera, required this.onTap}) : super(key: key);
  final bool isCamera;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 64.r,
        height: 64.r,
        decoration: BoxDecoration(
          backgroundBlendMode: isCamera ? BlendMode.color : null,
          color: isCamera ? EVMColors.bgFlipCamera : EVMColors.bgFlipCamera.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          sh(4.h),
          SvgPicture.asset(isCamera ? Assets.ic.barcodeReader : Assets.ic.barcodeReader, height: 20.w),
          sh(6.h),
          Text(
            isCamera ? 'リーダー付き' : 'カメラ付き',
            style: textTheme.labelSmall?.light().copyWith(color: EVMColors.white),
          ),
        ]),
      ),
    );
  }
}

class _FlipCameraButton extends StatelessWidget {
  const _FlipCameraButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: 64.r,
        height: 64.r,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.color,
          color: EVMColors.bgFlipCamera,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          sh(4.h),
          SvgPicture.asset(Assets.ic.flipCamera, width: 28.w),
          sh(6.h),
          Text(
            tr('common.switch_camera'),
            style: textTheme.labelSmall?.light().copyWith(color: EVMColors.white),
          ),
        ]),
      ),
    );
  }
}

class CameraScannerErrorWidget extends StatelessWidget {
  const CameraScannerErrorWidget({this.exception, super.key});

  final MobileScannerException? exception;

  String get errorMessage {
    switch (exception?.errorCode) {
      case MobileScannerErrorCode.permissionDenied:
        return tr('photo_taking.camera_access_denied');
      default:
        return tr('messages.undefined_error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.ic.error, width: 40.w, fit: BoxFit.fitWidth),
        sh(10.h),
        Text(errorMessage, style: textTheme.bodyMedium!.withColor(EVMColors.redDeep)),
      ],
    );
  }
}
