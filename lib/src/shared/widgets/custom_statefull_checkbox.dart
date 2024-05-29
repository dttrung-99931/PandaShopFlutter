import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStatefullCheckbox extends StatefulWidget {
  CustomStatefullCheckbox({
    required this.initialCheck,
    required this.onCheckChanged,
    this.label,
    this.size,
    this.shape = BoxShape.circle,
    this.labelStyle,
    this.spacing,
    this.rebuildOutOfWidget = false,
    super.key,
    EdgeInsets? checkPadding,
    this.uncheckBackgroundColor,
  }) : checkPadding = checkPadding ?? EdgeInsets.only(top: 4.h, bottom: 4.h);

  final bool initialCheck;
  final void Function(bool isChecked) onCheckChanged;
  final String? label;
  final double? size;
  final BoxShape shape;
  final TextStyle? labelStyle;
  final double? spacing;
  final EdgeInsets checkPadding;
  final Color? uncheckBackgroundColor;
  final bool? rebuildOutOfWidget;

  @override
  State<CustomStatefullCheckbox> createState() => _CustomStatefullCheckboxState();
}

class _CustomStatefullCheckboxState extends State<CustomStatefullCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.initialCheck;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomStatefullCheckbox oldWidget) {
    _isChecked = widget.initialCheck;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rebuildOutOfWidget!) {
      _isChecked = widget.initialCheck;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onCheckChanged(_isChecked);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: widget.size ?? 24.r,
              width: widget.size ?? 24.r,
              decoration: BoxDecoration(
                shape: widget.shape,
                color: _isChecked ? AppColors.primary : widget.uncheckBackgroundColor,
                border: _isChecked ? null : Border.all(color: EVMColors.blackLight),
                borderRadius: widget.shape == BoxShape.rectangle ? BorderRadius.circular(4) : null,
              ),
              alignment: Alignment.center,
              padding: widget.checkPadding,
              child: _isChecked ? SvgPicture.asset(Assets.ic.checkRounded, color: Colors.white) : null,
            ),
            if (widget.label != null)
              Padding(
                padding: EdgeInsets.only(left: widget.spacing ?? 6.w),
                child: Text(widget.label!.tr(), style: widget.labelStyle ?? textTheme.bodySmall),
              ),
          ],
        ),
      ),
    );
  }
}
