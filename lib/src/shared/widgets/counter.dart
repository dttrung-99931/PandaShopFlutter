import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Counter extends StatelessWidget {
  const Counter({
    required this.value,
    this.enabled = true,
    this.minimum = 1,
    this.maximum,
    this.onIncrease,
    this.onDecrease,
    this.width,
    super.key,
  });

  final int value;
  final bool enabled;
  final int minimum;
  final int? maximum;
  final void Function()? onIncrease;
  final void Function()? onDecrease;
  final double? width;

  bool get _canIncrease => enabled && (maximum == null || value < maximum!) && onIncrease != null;

  bool get _canDecrease => enabled && (value > minimum) && onDecrease != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 128.w,
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: EVMColors.blackLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _iconButton(Assets.ic.minus, onDecrease, _canDecrease),
          const VerticalDivider(color: EVMColors.blackLight, width: 0),
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                '$value',
                style: textTheme.titleMedium!.copyWith(
                  fontFamily: 'Arial',
                  color: EVMColors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const VerticalDivider(color: EVMColors.blackLight, width: 0),
          _iconButton(Assets.ic.plus, onIncrease, _canIncrease),
        ],
      ),
    );
  }

  Widget _iconButton(String icon, void Function()? onTap, bool isEnable) {
    return Expanded(
      flex: 5,
      child: InkWell(
        onTap: isEnable ? onTap : null,
        child: Center(
          child: SvgPicture.asset(icon, width: 16.w, color: isEnable ? EVMColors.blue : EVMColors.divider),
        ),
      ),
    );
  }
}
