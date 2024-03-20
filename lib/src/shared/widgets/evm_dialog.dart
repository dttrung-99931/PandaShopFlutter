import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EVMDialog extends StatelessWidget {
  const EVMDialog({
    required this.width,
    required this.child,
    this.title,
    this.height,
    this.leading,
    this.onClose,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final Widget child;
  final String? title;
  final double width;
  final double? height;
  final Widget? leading;
  final EdgeInsets? padding;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: padding,
      backgroundColor: EVMColors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.w),
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context),
              if (height == null) child else Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Expanded(
            child: leading != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [leading!],
                  )
                : const SizedBox(),
          ),
          if (title != null) Text(tr(title!), style: textTheme.bodyLarge),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onClose ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: SvgPicture.asset(Assets.ic.close, width: 28.w, height: 28.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
