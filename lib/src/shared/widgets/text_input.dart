import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
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
    this.isPasswordInput = false,
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
    this.suffixIcon,
    this.disableColor = EVMColors.lightGrey2,
    this.borderColor = EVMColors.border,
    this.expandHeight = false,
    this.autoDisposeFocusNode = true,
    this.selectAllOnFocus = false,
    this.autoValidateOnUnfocus = false,
    this.onFocusChanged,
    this.errorFontSize,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  final String? hintText;
  final double? width;
  final double? height;
  final Widget? title;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPasswordInput;
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
  final Widget? suffixIcon;
  final Color disableColor;
  final Color borderColor;
  final bool expandHeight;
  final bool autoDisposeFocusNode;
  final bool selectAllOnFocus;
  final bool autoValidateOnUnfocus;
  final Function(bool isFocused)? onFocusChanged;
  final double? errorFontSize;
  final AutovalidateMode autovalidateMode;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var isSecure = true;

  Timer? timer;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );

  late FocusNode _focusNode;
  late final _controller = widget.controller ?? TextEditingController();

  final _key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFoucusChanged);
  }

  @override
  void didUpdateWidget(covariant TextInput oldWidget) {
    if (widget.focusNode != null && _focusNode != widget.focusNode) {
      _focusNode.removeListener(_onFoucusChanged);
      _focusNode.dispose();
      _focusNode = widget.focusNode!;
      widget.focusNode!.addListener(_onFoucusChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFoucusChanged);
    if (widget.autoDisposeFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFoucusChanged() {
    if (!_focusNode.hasFocus && widget.autoValidateOnUnfocus) {
      _key.currentState?.validate();
    }
    if (_focusNode.hasFocus && widget.selectAllOnFocus) {
      _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
    }
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

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
            key: _key,
            focusNode: _focusNode,
            expands: widget.expandHeight,
            maxLines: widget.expandHeight ? null : widget.maxLines,
            minLines: widget.expandHeight ? null : widget.minLines,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: widget.textInputType,
            initialValue: widget.initText,
            enabled: widget.enabled,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onSubmited,
            readOnly: widget.readOnly,
            onEditingComplete: widget.onEditingComplete,
            obscureText: widget.isPasswordInput ? isSecure : false,
            controller: widget.controller,
            validator: widget.validator,
            style: widget.style ?? textTheme.bodyLarge,
            autovalidateMode: widget.autovalidateMode,
            decoration: InputDecoration(
              errorStyle: textTheme.labelMedium?.copyWith(
                color: EVMColors.redDeep,
                fontSize: widget.errorFontSize,
                height: 1.0,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: EVMColors.blackLight, width: 1),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedErrorBorder: _focusedBorder,
              fillColor: widget.enabled ? EVMColors.white : widget.disableColor,
              filled: true,
              suffixIconConstraints: const BoxConstraints(maxHeight: 30),
              suffixIcon: widget.suffixIcon ?? (widget.isPasswordInput ? _pwdEye() : null),
              isDense: true,
              hintText: tr(widget.hintText ?? ''),
              enabledBorder: widget.border ?? _border,
              focusedBorder: _focusedBorder,
              border: widget.border ?? _border,
              disabledBorder: _border,
              hintStyle: (widget.hintStyle ?? widget.style ?? textTheme.bodyMedium!).withColor(EVMColors.hint),
              contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
            ),
            onTap: () {
              widget.onTap?.call();
            },
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
            alignment: Alignment.center,
            children: [
              const Icon(Icons.remove_red_eye_outlined, color: AppColors.blackLight),
              if (isSecure)
                Text(
                  '/',
                  style: textTheme.bodyMedium.withColor(AppColors.blackLight).bold(),
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
