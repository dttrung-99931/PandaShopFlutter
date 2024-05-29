import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomCalendarPicker extends StatelessWidget {
  const CustomCalendarPicker({
    super.key,
    @required this.controller,
    this.onSelectDate,
  });

  final DateRangePickerController? controller;
  final Function(DateTime)? onSelectDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SfDateRangePicker(
          showNavigationArrow: true,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs selected) {
            onSelectDate!(selected.value);
          },
          controller: controller,

          ////header
          headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: textTheme.bodyLarge!.copyWith(color: EVMColors.blueDark),
          ),
          headerHeight: 70.h,

          ////viewHeader
          monthViewSettings: DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
          ),

          ////date settings
          todayHighlightColor: EVMColors.blue,
          monthCellStyle: const DateRangePickerMonthCellStyle(
            disabledDatesTextStyle: TextStyle(color: EVMColors.red),
            blackoutDatesDecoration: BoxDecoration(color: EVMColors.red, shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(color: Colors.white),
            todayTextStyle: TextStyle(color: Colors.black),
            textStyle: TextStyle(color: Colors.black),
          ),
          yearCellStyle: const DateRangePickerYearCellStyle(
            todayTextStyle: TextStyle(color: Colors.black),
            textStyle: TextStyle(color: Colors.black),
          ),

          ////selection
          selectionTextStyle: textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          selectionColor: Colors.blue,
        ),
      ],
    );
  }
}
