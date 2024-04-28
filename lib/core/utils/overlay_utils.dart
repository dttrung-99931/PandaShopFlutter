import 'package:another_flushbar/flushbar.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/overlay_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'log.dart';

enum SnackType { success, fail, normal }
// ignore_for_file: use_build_context_synchronously

GlobalKey? _flushBarKey;
String? _showingMsg;
Future<void> showSnackBar(String? msg, [type = SnackType.success]) async {
  msg ??= '';
  // Don't show duplicated snackbar together
  if (_showingMsg == msg) {
    return;
  }
  _showingMsg = msg;
  logd('SNACKBAR: $msg');
  if (_isShowingLoading) {
    hideLoadingOverlay();
  }
  // Await dismiss to fix 'entry.currentState == _RouteLifecycle.popping': is not true
  await (_flushBarKey?.currentWidget as Flushbar?)?.dismiss();
  _flushBarKey = GlobalKey(); // renew key to fix duplicated key error when showSnackBar continueously
  Color color;
  switch (type) {
    case SnackType.fail:
      color = AppColors.red;
      break;
    case SnackType.success:
      color = AppColors.blueDark;
      break;
    default:
      color = Colors.black;
  }
  await Flushbar(
    key: _flushBarKey,
    messageText: Text(
      msg,
      style: textTheme.bodyMedium!.withColor(color),
      maxLines: 4,
      textAlign: TextAlign.center,
    ),
    margin: EdgeInsets.only(top: 20.h, left: 48.w, right: 48.w),
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h, bottom: 8.h),
    borderRadius: BorderRadius.circular(10),
    borderColor: color,
    backgroundColor: AppColors.white,
    duration: 4.seconds,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    animationDuration: 500.milliseconds,
    boxShadows: [
      BoxShadow(
        color: AppColors.blackLight.withOpacity(0.3),
        offset: const Offset(0, 2),
        blurRadius: 3,
      )
    ],
  ).show(Global.context).then((value) => _showingMsg = null);
}

bool _isShowingLoading = false;

void showLoadingOverlay({bool canDismiss = false, Color? backgroundColor}) {
  try {
    Global.navigator.push(OverlayLoadingPage(
      canDismiss: canDismiss,
      backgroundColor: backgroundColor,
    ));
    _isShowingLoading = true;
  } catch (e) {
    loge(e);
  }
}

void hideLoadingOverlay() {
  try {
    if (_isShowingLoading) {
      Global.hideAllSnackbars();
      Global.navigator.pop();
      _isShowingLoading = false;
    }
  } catch (e) {
    loge(e);
  }
}

void commingSoon() {
  showSnackBar('Tính năng đang được phát triển');
}

void showFailedSnackBar(String? msg) {
  showSnackBar(msg, SnackType.fail);
}
