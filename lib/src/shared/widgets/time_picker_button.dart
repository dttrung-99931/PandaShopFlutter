import 'dart:developer';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'overlay_button.dart';

class TimePickerButton extends StatelessWidget {
  const TimePickerButton({
    this.selectedTime,
    this.height,
    this.enabled = true,
    this.onSelectTime,
    this.overlayLevel = 1,
    super.key,
  });

  final TimeOfDay? selectedTime;
  final double? height;
  final bool enabled;
  final void Function(TimeOfDay?)? onSelectTime;
  final int overlayLevel;

  @override
  Widget build(BuildContext context) {
    return OverlayButton(
      enabled: enabled,
      level: overlayLevel,
      button: Container(
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
                  if (selectedTime != null)
                    Text(
                      FormatUtils.formatTimeOfDay(selectedTime!),
                      style: textTheme.bodyMedium!.arial().spacing(-24).regular(),
                    ),
                  const Spacer(),
                  SvgPicture.asset(Assets.ic.arrowDown, width: 13.w, color: EVMColors.blue),
                ],
              )
            : null,
      ),
      overlay: SizedBox(
        height: 250.h,
        width: 100.w,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            minuteInterval: 5,
            initialDateTime: _initialDateTime,
            onDateTimeChanged: (date) {
              onSelectTime?.call(TimeOfDay(hour: date.hour, minute: date.minute));
            },
          ),
        ),
      ),
    );
  }

  DateTime get _initialDateTime {
    if (selectedTime == null) {
      return DateTime(2023, 1, 1, 0, 0);
    }

    if (selectedTime!.minute % 5 != 0) {
      log('Error: selectedTime.minute (${selectedTime!.minute}) not divisible by 5', name: 'TimePickerButton');
      return DateTime(2023, 1, 1, 0, 0);
    }

    return DateTime(2023, 1, 1, selectedTime!.hour, selectedTime!.minute);
  }
}
