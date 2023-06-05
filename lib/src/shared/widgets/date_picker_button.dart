import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'custom_calendar_picker.dart';
import 'overlay_button.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    required this.controller,
    this.selectedDate,
    this.height,
    this.width,
    this.enabled = true,
    this.onSelectDate,
    this.overlayLevel = 1,
    this.textStyle,
    this.hintText,
    super.key,
  });

  final DateRangePickerController controller;
  final DateTime? selectedDate;
  final double? height;
  final double? width;
  final bool enabled;
  final void Function(DateTime?)? onSelectDate;
  final int overlayLevel;
  final TextStyle? textStyle;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return OverlayButton(
      enabled: enabled,
      level: overlayLevel,
      button: Container(
        width: width,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          border: Border.all(color: EVMColors.border),
          borderRadius: BorderRadius.circular(4),
          color: enabled ? EVMColors.white : EVMColors.lightGrey2,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: enabled
            ? Row(
                children: [
                  if (selectedDate != null)
                    Text(
                      FormatUtils.formatDate(selectedDate!),
                      style: textStyle ?? textTheme.bodyMedium!.arial().regular(),
                    )
                  else if (hintText != null)
                    Text(
                      hintText!,
                      style: (textStyle ?? textTheme.bodyMedium!.light()).withColor(EVMColors.hint),
                    ),
                  const Spacer(),
                  SvgPicture.asset(Assets.ic.calendar, width: 22.w, color: EVMColors.blue),
                ],
              )
            : null,
      ),
      overlay: SizedBox(
        height: 250.h,
        width: 300.w,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          color: Colors.white,
          child: CustomCalendarPicker(
            controller: controller,
            onSelectDate: (date) {
              onSelectDate?.call(date);
            },
          ),
        ),
      ),
    );
  }
}
