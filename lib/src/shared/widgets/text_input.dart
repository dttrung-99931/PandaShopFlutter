import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    this.hintText,
    this.title,
    this.validator,
    this.width,
    this.controller,
    Key? key,
    this.passwordChar = false,
    this.onChange,
    this.onSubmited,
    this.onEditingComplete,
    this.onTap,
    this.focusNode,
    this.padding,
    this.textInputType,
    this.initText,
    this.height,
    this.readOnly = false,
    this.textInputAction = TextInputAction.done,
    this.awaitDuration = const Duration(milliseconds: 800),
    this.asyncCallback,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.borderRadius = 6,
    this.contentPadding,
    this.style,
    this.hintStyle,
    this.border,
  }) : super(key: key);

  final String? hintText;
  final double? width, height;
  final Widget? title;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool passwordChar;
  final Function(String)? onChange;
  final Function(String)? onSubmited;
  final Function()? onEditingComplete;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? initText;
  final Duration awaitDuration;
  final Function(String)? asyncCallback;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final InputBorder? border;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var isSecure = true;

  Timer? timer;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: const BorderSide(color: EVMColors.border),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: widget.title,
              )
            : const SizedBox(),
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height,
          child: TextFormField(
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            keyboardType: widget.textInputType,
            initialValue: widget.initText,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            onTap: () {
              try {
                widget.onTap!();
              } catch (e) {
                log('$e');
              }
            },
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onSubmited,
            readOnly: widget.readOnly,
            onChanged: (val) {
              if (widget.onChange != null) widget.onChange!(val);

              //is async callback enable
              if (widget.asyncCallback != null) {
                //cancel timer if it's active
                if (timer != null && timer!.isActive) {
                  timer!.cancel();
                }
                //new timer
                timer = Timer(widget.awaitDuration, () {
                  if (widget.asyncCallback != null) widget.asyncCallback!(val);
                });
              }
            },
            onEditingComplete: widget.onEditingComplete,
            obscureText: widget.passwordChar ? isSecure : false,
            controller: widget.controller,
            validator: widget.validator,
            style: widget.style ?? textTheme.bodyLarge,
            decoration: InputDecoration(
              fillColor: widget.enabled ? EVMColors.white : EVMColors.lightGrey2,
              filled: true,
              suffixIconConstraints: const BoxConstraints(maxHeight: 30),
              suffixIcon: widget.passwordChar ? _pwdEye() : null,
              isDense: true,
              hintText: tr(widget.hintText ?? ''),
              enabledBorder: widget.border ?? _border,
              focusedBorder: _focusedBorder,
              border: widget.border ?? _border,
              disabledBorder: _border,
              hintStyle: (widget.hintStyle ?? widget.style ?? textTheme.bodyMedium!).withColor(EVMColors.hint),
              contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
            ),
          ),
        ),
      ],
    );
  }

  Padding _pwdEye() {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: InkWell(
          child: Stack(
            children: [
              const Icon(Icons.remove_red_eye_outlined, color: AppColors.blackLight),
              if (isSecure)
                Transform.translate(
                  offset: const Offset(0, -2),
                  child: Text(
                    '  /',
                    style: textTheme.bodyLarge.withColor(AppColors.blackLight).bold(),
                  ),
                ),
            ],
          ),
          onTap: () {
            setState(() {
              isSecure = !isSecure;
            });
          }),
    );
  }
}
