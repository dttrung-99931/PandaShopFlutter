import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

class SignUpSteps extends StatelessWidget {
  final int currentStep;
  final double marginLeft;
  const SignUpSteps({
    Key? key,
    this.currentStep = 1,
    this.marginLeft = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: marginLeft),
        SignUpStep(
          isCurrentStep: currentStep == 1,
          name: 'auth.enter_account_info',
          showLeftLine: false,
          showRightLine: true,
        ),
        SignUpStep(
          isCurrentStep: currentStep == 2,
          name: 'auth.enter_lab_info',
          showLeftLine: true,
          showRightLine: true,
        ),
        SignUpStep(
          isCurrentStep: currentStep == 3,
          name: 'auth.confirm_input_contents',
          showLeftLine: true,
          showRightLine: false,
        ),
      ],
    );
  }
}

class SignUpStep extends StatelessWidget {
  static const double width = 220;

  final String name;
  final bool isCurrentStep;
  final bool showLeftLine;
  final bool showRightLine;
  const SignUpStep({
    Key? key,
    required this.name,
    required this.isCurrentStep,
    required this.showLeftLine,
    required this.showRightLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: showLeftLine ? EVMColors.blackLight : EVMColors.transparent,
                  thickness: 2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isCurrentStep ? EVMColors.primary : EVMColors.blackLight,
                  shape: BoxShape.circle,
                ),
                width: isCurrentStep ? 24 : 12,
                height: isCurrentStep ? 24 : 12,
              ),
              Expanded(
                child: Divider(
                  color: showRightLine ? EVMColors.blackLight : EVMColors.transparent,
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            tr(name),
            style: textTheme.bodySmall?.copyWith(
              color: isCurrentStep ? EVMColors.primary : EVMColors.blackLight.withOpacity(.5),
              fontWeight: isCurrentStep ? FontWeight.normal : FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
