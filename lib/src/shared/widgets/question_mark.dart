import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';

import 'position_dialog.dart';

class QuestionMark extends StatelessWidget {
  final GlobalKey _key;
  final String guide;
  final double? width;
  final Offset translatePopupOffset;

  QuestionMark(this.guide, {super.key, this.width, Offset? translateOffset})
      : translatePopupOffset = translateOffset ?? Offset(40.w, -16.h),
        _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: () {
        showDialog(
          barrierColor: EVMColors.transparent,
          context: context,
          builder: (context) => PositionDialog(
            showingPosition: _key.position.translate(translatePopupOffset.dx, translatePopupOffset.dy),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: EVMColors.bgInformationDialog,
                border: Border.all(color: EVMColors.borderInformationDialog),
              ),
              child: Text(guide.tr(), style: textTheme.bodySmall),
            ),
          ),
        );
      },
      child: SvgPicture.asset(Assets.ic.questionMark, width: width),
    );
  }
}
