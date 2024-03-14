import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/shared/widgets/neutral_button.dart';
import 'package:evievm_app/src/shared/widgets/positive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/theme.dart';
import 'spacing_row.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    this.title = '',
    this.message,
    this.content,
    required this.width,
    required this.positiveLabel,
    this.negativeLabel,
    this.neutralLabel = 'Hủy bỏ',
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
    final color = primaryColor ?? (isDoneIcon ? AppColors.green2 : AppColors.red);
    return Dialog(
      backgroundColor: AppColors.transparent,
      child: Stack(
        children: [
          Container(
            width: width,
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title.isNotEmpty) ...[
                  8.shb,
                  Text(tr(title), style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                  20.shb,
                ],
                if (message != null) ...[
                  Row(children: [
                    Expanded(
                      child: Text(
                        tr(message!),
                        style: textTheme.bodyLarge!.spacing(-24).light(),
                      ),
                    )
                  ]),
                  10.shb,
                ],
                if (content != null) ...[
                  content!,
                  24.shb,
                ],
                SpacingRow(
                  spacing: 12.w,
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
          // TODO:
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 0,
          //   child: SvgPicture.asset(
          //     isDoneIcon ? Assets.ic.doneCircle : Assets.ic.warningCircle,
          //     width: 64.h,
          //     height: 64.h,
          //   ),
          // ),
        ],
      ),
    );
  }
}
