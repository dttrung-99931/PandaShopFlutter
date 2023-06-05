import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/neutral_button.dart';
import 'package:evievm_app/src/shared/widgets/positive_button.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'spacing_row.dart';

class EVMAlertDialog extends StatelessWidget {
  const EVMAlertDialog({
    required this.title,
    this.message,
    this.content,
    required this.width,
    required this.positiveLabel,
    this.negativeLabel,
    this.neutralLabel = 'common.cancel',
    this.onPositivePressed,
    this.onNegativePressed,
    this.onNeutralPressed,
    this.primaryColor,
    this.isDoneIcon = false,
    super.key,
  });

  final String title;
  final String? message;
  final Widget? content;
  final double width;
  final String positiveLabel;
  final String? negativeLabel;
  final String neutralLabel;
  final void Function()? onPositivePressed;
  final void Function()? onNegativePressed;
  final void Function()? onNeutralPressed;
  final Color? primaryColor;
  final bool isDoneIcon;

  @override
  Widget build(BuildContext context) {
    final color = primaryColor ?? (isDoneIcon ? EVMColors.green2 : EVMColors.redDeep);
    return Dialog(
      backgroundColor: EVMColors.transparent,
      child: Stack(
        children: [
          Container(
            width: width,
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: EVMColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sh(36.h),
                Text(tr(title), style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                sh(29.h),
                if (message != null)
                  Row(children: [
                    Expanded(
                      child: Text(
                        tr(message!),
                        style: textTheme.bodyLarge!.spacing(-24).light(),
                      ),
                    )
                  ]),
                sh(10.h),
                if (content != null) content!,
                sh(24.h),
                SpacingRow(
                  spacing: 16.w,
                  children: [
                    Expanded(
                      child: NeutralButton(
                        label: neutralLabel,
                        onPressed: onNeutralPressed ?? () => Global.hideDialog(context),
                      ),
                    ),
                    if (negativeLabel != null)
                      Expanded(
                        child: NeutralButton(
                          label: negativeLabel!,
                          onPressed: onNegativePressed,
                          color: color,
                        ),
                      ),
                    Expanded(
                      child: PositiveButton(
                        label: positiveLabel,
                        onPressed: onPositivePressed,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              isDoneIcon ? Assets.ic.doneCircle : Assets.ic.warningCircle,
              width: 64.h,
              height: 64.h,
            ),
          ),
        ],
      ),
    );
  }
}
