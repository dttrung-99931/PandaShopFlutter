// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as s;
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextType {
  normal,
  error,
}

class InfoInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String secondHint;
  final TextEditingController? secondController;
  final String title;
  final String? bottomText;
  final TextType bottomTextType;
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
  final double? secondInputWidth;

  /// when [isEditable] = false then display [textDisplayWhenNotEditable] if [controller] = null
  final String textDisplayWhenNotEditable;

  final bool expandTrailing;

  final bool hasRightSpace;

  final int titleFlex;
  final String? Function(String? text)? validator;
  final String? Function(String? text)? secondValidator;
  final void Function()? onTextFieldUnfocus;
  final void Function()? onSecondaryTextFieldUnfocus;
  final dynamic Function(String text)? onTextChanged;
  final dynamic Function(String text)? onSecondaryTextChanged;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPasswordInput;
  final AutovalidateMode autovalidateMode;
  final bool enabled;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final double labelTopMargin;
  final double trailingSpacing;
  final double? textInputHeight;
  late final ValueNotifier<bool> _shouldShowInputErr = ValueNotifier(initialShouldShowError);
  late final ValueNotifier<bool> _shouldShowSecondInputErr = ValueNotifier(initialShouldShowError);
  final List<s.TextInputFormatter>? inputFormatters;

  /// Used to fix input error msg disappered when unfocus [SignUpStep2LabInfoInputScreen]
  final bool initialShouldShowError;
  final bool showTitle;
  final bool expandHeight;
  final dynamic Function(String)? onSubmited;
  final double verticalPadding;
  final Axis direction;
  final double spacing;

  InfoInput({
    Key? key,
    this.controller,
    this.hint = '',
    this.secondHint = '',
    this.secondController,
    this.title = '',
    this.bottomText,
    this.bottomTextType = TextType.normal,
    this.showBottomDivider = false,
    this.showTopDivider = false,
    this.showRequiredLabel = false,
    this.customInput,
    this.trailing,
    this.isEditable = true,
    this.paddingRight = 16,
    this.paddingLeft = 16,
    this.requireBackgroundColor = EVMColors.red,
    TextStyle? titleStyle,
    this.textDisplayWhenNotEditable = '',
    this.inputWidth,
    this.secondInputWidth,
    this.expandTrailing = true,
    this.hasRightSpace = false,
    this.titleFlex = 8,
    this.validator,
    this.secondValidator,
    this.onTextFieldUnfocus,
    this.onSecondaryTextFieldUnfocus,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.isPasswordInput = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onTextChanged,
    this.onSecondaryTextChanged,
    this.enabled = true,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.labelTopMargin = 0,
    double? trailingSpacing,
    this.textInputHeight,
    this.inputFormatters,
    this.initialShouldShowError = false,
    this.showTitle = true,
    this.expandHeight = false,
    this.onSubmited,
    this.verticalPadding = 6,
    this.direction = Axis.horizontal,
    double? spacing,
  })  : trailingSpacing = trailingSpacing ?? 16.w,
        titleStyle = titleStyle ??
            textTheme.bodyMedium!.copyWith(
              fontWeight: direction == Axis.horizontal ? FontWeight.normal : FontWeight.w600,
            ),
        assert(
          // ignore: unrelated_type_equality_checks
          controller != customInput, // both must not be null together
          'Either controller must be != null OR customInput != null',
        ),
        spacing = spacing ?? (direction == Axis.horizontal ? 0 : 12.h),
        super(key: key);

  factory InfoInput.onlyInput({
    required String hint,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    TextInputAction inputAction = TextInputAction.next,
    String? Function(String? text)? validator,
    Function(String? text)? onSubmited,
    bool isPasswordInput = false,
  }) {
    return InfoInput(
      controller: controller,
      inputType: inputType,
      inputAction: inputAction,
      validator: validator,
      hint: hint,
      onSubmited: onSubmited,
      isPasswordInput: isPasswordInput,
      paddingLeft: 0,
      paddingRight: 0,
      showTitle: false,
      verticalPadding: 2.h,
    );
  }

  bool get isHorizontal => direction == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    Widget inputContent = isEditable
        ? _inputContent(_input(), _secondInput())
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              controller?.text ?? textDisplayWhenNotEditable,
              style: textTheme.bodyMedium,
            ),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTopDivider) const Divider(color: EVMColors.blackLight),
        SizedBox(height: verticalPadding),
        Flex(
          direction: direction,
          crossAxisAlignment: columnCrossAxisAlignment,
          children: [
            SizedBox(width: paddingLeft),
            if (showTitle)
              isHorizontal
                  ? Expanded(
                      flex: titleFlex,
                      child: _title(),
                    )
                  : _title(),
            isHorizontal ? spacing.swb : spacing.shb,
            isHorizontal ? Expanded(flex: 14, child: inputContent) : inputContent,
            if (hasRightSpace) const ExpandedSizedBox(flex: 4),
          ],
        ),
        if (bottomText != null) const SizedBox(height: 6.0),
        if (bottomText != null) _bottomText(),
        SizedBox(height: verticalPadding),
        if (showBottomDivider) const Divider(color: EVMColors.blackLight),
      ],
    );
  }

  Widget? _secondInput() {
    return secondController != null
        ? ValueListenableBuilder<bool>(
            valueListenable: _shouldShowSecondInputErr,
            builder: (_, showErr, __) {
              return TextInput(
                // inputFormatters: inputFormatters,
                onFocusChanged: (hasFocus) {
                  if (!hasFocus) {
                    _shouldShowSecondInputErr.value = true;
                  }
                },
                textInputType: inputType,
                textInputAction: inputAction,
                // isPasswordInput: isPasswordInput,
                hintText: secondHint,
                controller: secondController,
                validator: secondValidator,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // autoValidateOnUnfocus: true,
                style: textTheme.bodyMedium,
                onChange: (text) {
                  _shouldShowSecondInputErr.value = true;
                  onSecondaryTextChanged?.call(text);
                },
                enabled: enabled,
                errorFontSize: showErr ? 14.sp : 0,
              );
            },
          )
        : null;
  }

  Widget _input() {
    return customInput ??
        ValueListenableBuilder<bool>(
          valueListenable: _shouldShowInputErr,
          builder: (_, showErr, __) {
            return TextInput(
              // inputFormatters: inputFormatters,
              onFocusChanged: (hasFocus) {
                if (!hasFocus) {
                  _shouldShowInputErr.value = true;
                }
              },
              autoValidateOnUnfocus: true,
              autovalidateMode: autovalidateMode,
              textInputType: inputType,
              textInputAction: inputAction,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
              isPasswordInput: isPasswordInput,
              hintText: tr(hint),
              controller: controller,
              validator: validator,
              style: textTheme.bodyMedium,
              onChange: (text) {
                _shouldShowInputErr.value = true;
                onTextChanged?.call(text);
              },
              enabled: enabled,
              height: textInputHeight,
              errorFontSize: showErr ? 14.sp : 0,
              expandHeight: expandHeight,
              onSubmited: onSubmited,
            );
          },
        );
  }

  Row _bottomText() {
    return Row(
      children: [
        const SizedBox(width: 16),
        ExpandedSizedBox(flex: titleFlex),
        if (bottomTextType == TextType.error) sw(12.w),
        Expanded(
          flex: 14,
          child: Text(
            tr(bottomText!),
            style: textTheme.labelMedium?.copyWith(
              color: bottomTextType == TextType.normal ? EVMColors.blackLight : EVMColors.redDeep,
            ),
          ),
        ),
        if (hasRightSpace) const ExpandedSizedBox(flex: 4),
      ],
    );
  }

  Column _inputContent(Widget input, Widget? secondInput) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: rowCrossAxisAlignment,
          children: [
            inputWidth != null ? SizedBox(width: inputWidth, child: input) : Expanded(child: input),
            if (secondController != null) const SizedBox(width: 16),
            if (secondController != null)
              secondInputWidth != null
                  ? SizedBox(width: secondInputWidth, child: secondInput)
                  : Expanded(child: secondInput!),
            if (trailing != null) sw(trailingSpacing),
            if (trailing != null) expandTrailing ? Expanded(child: trailing!) : trailing!,
            SizedBox(width: paddingRight),
          ],
        ),
      ],
    );
  }

  Column _title() {
    return Column(
      children: [
        sh(labelTopMargin),
        Row(
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
                  tr('common.required'),
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: EVMColors.white,
                  ),
                ),
              ),
          ],
        ),
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
