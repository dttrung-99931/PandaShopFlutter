import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/src/features/top/presentation/screens/top_screen.dart';
import 'package:evievm_app/src/shared/widgets/question_mark.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';

class EVMAppBar extends StatelessWidget {
  final String title;
  final String guide;
  final String redNote;
  final List<Widget>? trailings;
  final void Function()? onBack;
  final void Function()? onBackToHome;

  const EVMAppBar({
    Key? key,
    required this.title,
    this.guide = '',
    this.redNote = '',
    this.trailings,
    this.onBack,
    this.onBackToHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.appBarHeight,
      color: EVMColors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackToHome ?? () => Global.navigator.popUntil(ModalRoute.withName(TopScreen.router)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
              color: EVMColors.primary,
              child: SvgPicture.asset(Assets.ic.evm, color: EVMColors.white),
            ),
          ),
          sw(12.w),
          Material(
            color: EVMColors.transparent,
            child: IconButton(
              splashRadius: 24,
              onPressed: onBack ?? () => Global.navigator.pop(),
              icon: SvgPicture.asset(Assets.ic.left),
            ),
          ),
          sw(8.w),
          Text(tr(title), style: textTheme.bodyLarge),
          sw(4.w),
          if (guide.isNotEmpty) QuestionMark(guide),
          const Spacer(),
          if (redNote.isNotEmpty)
            Text(
              redNote.tr(),
              style: textTheme.bodyMedium?.copyWith(color: EVMColors.redDeep),
            ),
          if (redNote.isNotEmpty) sw(12.w),
          if (trailings != null) ...trailings!,
        ],
      ),
    );
  }
}
