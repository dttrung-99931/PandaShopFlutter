// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';

import '../../../../shared/widgets/color_container.dart';

class InfoInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final TextEditingController? secondController;
  final String title;
  final String? bottomTextInputLabel;
  final TextStyle titleStyle;
  final bool showBottomDivider;
  final bool showTopDivider;
  final bool showRequiredLabel;
  final Widget? customInput;
  final Widget? trailing;
  final bool isEditable;
  final double paddingRight;
  final double paddingLeft;
  final Color requireBackgroundColor;

  /// Expand input if not present
  final double? inputWidth;

  /// when [isEditable] = true then display [defaultTextWhenNotEditable] if [controller] = null
  final String defaultTextWhenNotEditable;

  final bool expandTrailing;

  final bool hasRightSpace;

  final int titleFlex;

  InfoInput({
    Key? key,
    this.controller,
    this.hint = '',
    this.secondController,
    required this.title,
    this.bottomTextInputLabel,
    this.showBottomDivider = false,
    this.showTopDivider = true,
    this.showRequiredLabel = true,
    this.customInput,
    this.trailing,
    this.isEditable = true,
    this.paddingRight = 0,
    this.paddingLeft = 16,
    this.requireBackgroundColor = EVMColors.red,
    TextStyle? titleStyle,
    this.defaultTextWhenNotEditable = '',
    this.inputWidth,
    this.expandTrailing = true,
    this.hasRightSpace = true,
    this.titleFlex = 6,
  })  : titleStyle = titleStyle ?? textTheme.bodyMedium!,
        assert(
          controller != customInput,
          'Either controller must be != null OR customInput != null',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var input = customInput ?? TextInput(hintText: tr(hint), controller: controller);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTopDivider) const Divider(color: EVMColors.blackLight),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: paddingLeft),
            Expanded(
              flex: titleFlex,
              child: Row(
                children: [
                  Text(tr(title), style: titleStyle),
                  const SizedBox(width: 20),
                  if (showRequiredLabel)
                    Container(
                      decoration: BoxDecoration(
                        color: requireBackgroundColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 6,
                      ),
                      child: Text(
                        tr('auth.required'),
                        style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: EVMColors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 14,
              child: isEditable
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            inputWidth != null ? SizedBox(width: inputWidth, child: input) : Expanded(child: input),
                            if (secondController != null) const SizedBox(width: 16),
                            if (secondController != null)
                              Expanded(child: TextInput(hintText: '', controller: secondController)),
                            if (trailing != null) const SizedBox(width: 16),
                            if (trailing != null) expandTrailing ? Expanded(child: trailing!) : trailing!,
                            SizedBox(width: paddingRight),
                          ],
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        controller?.text ?? defaultTextWhenNotEditable,
                        style: textTheme.bodyMedium,
                      ),
                    ),
            ),
            if (hasRightSpace) const ExpandedSizedBox(flex: 4),
          ],
        ),
        if (bottomTextInputLabel != null)
          const SizedBox(
            height: 6.0,
          ),
        if (bottomTextInputLabel != null)
          Row(
            children: [
              const SizedBox(width: 16),
              const ExpandedSizedBox(flex: 6),
              Expanded(
                flex: 14,
                child: Text(
                  tr(bottomTextInputLabel!),
                  style: textTheme.bodyMedium?.copyWith(color: EVMColors.hint),
                ),
              ),
              const ExpandedSizedBox(flex: 4),
            ],
          ),
        const SizedBox(height: 10),
        if (showBottomDivider) const Divider(color: EVMColors.blackLight),
      ],
    );
  }
}

class ExpandedSizedBox extends StatelessWidget {
  final int flex;
  const ExpandedSizedBox({
    Key? key,
    required this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex, child: const SizedBox());
  }
}
