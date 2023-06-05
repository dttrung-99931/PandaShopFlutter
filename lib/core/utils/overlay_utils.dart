import 'package:another_flushbar/flushbar.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/overlay_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'evm_colors.dart';
import 'log.dart';

enum SnackType { success, fail, normal }

class OverlayUtils {
  static GlobalKey? _flushBarKey;

  static void showSnackBar(String msg, [type = SnackType.success]) {
    (_flushBarKey?.currentWidget as Flushbar?)?.dismiss();
    _flushBarKey = GlobalKey(); // renew key to fix duplicated key error when showSnackBar continueously
    Color color;
    switch (type) {
      case SnackType.fail:
        color = EVMColors.redDeep;
        break;
      case SnackType.success:
        color = EVMColors.blueDark;
        break;
      default:
        color = Colors.black;
    }

    Flushbar(
      key: _flushBarKey,
      messageText: Text(
        msg,
        style: textTheme.bodyMedium!.withColor(color),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      margin: EdgeInsets.only(top: 20.h, left: 100.w, right: 100.w),
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h, bottom: 8.h),
      borderRadius: BorderRadius.circular(10),
      borderColor: color,
      backgroundColor: EVMColors.white,
      duration: 3.seconds,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: 500.milliseconds,
      boxShadows: [
        BoxShadow(
          color: EVMColors.blackLight.withOpacity(0.3),
          offset: const Offset(0, 2),
          blurRadius: 3,
        )
      ],
    ).show(Global.context);
  }

  static bool _isShowingLoading = false;

  static void showLoadingOverlay({bool canDismiss = false, Color? backgroundColor}) {
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

  static void hideLoadingOverlay() {
    try {
      if (_isShowingLoading) {
        Global.navigator.pop();
        _isShowingLoading = false;
      }
    } catch (e) {
      loge(e);
    }
  }
}
