import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final bool enabled;
  final List<T> dataItems;
  final Widget Function(T item) itemBuilder;
  final void Function(T? item) onSelected;
  final String? hintText;
  final TextStyle? hintStyle;
  final double borderRadius;
  final double? height;
  final Color? backgroundColor;
  final T? selectedItem;
  final List<T> disableItems;

  const CustomDropdownButton({
    Key? key,
    this.enabled = true,
    required this.dataItems,
    required this.itemBuilder,
    required this.onSelected,
    this.borderRadius = 6,
    this.hintText,
    this.hintStyle,
    this.height,
    this.backgroundColor,
    this.selectedItem,
    this.disableItems = const [],
  }) : super(key: key);

  @override
  State<CustomDropdownButton<T>> createState() => _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  T? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.selectedItem;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomDropdownButton<T> oldWidget) {
    _selectedItem = widget.selectedItem;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.enabled ? widget.backgroundColor : AppColors.background,
      ),
      child: DropdownButton<T>(
        value: _selectedItem,
        isExpanded: true,
        iconEnabledColor: AppColors.border,
        iconDisabledColor: AppColors.divider,
        iconSize: 32.r,
        underline: const SizedBox.shrink(),
        items: widget.dataItems
            .map(
              (T value) => DropdownMenuItem<T>(
                value: value,
                enabled: !widget.disableItems.contains(value),
                child: widget.itemBuilder(value),
              ),
            )
            .toList(),
        onChanged: widget.enabled
            ? (value) {
                _selectedItem = value;
                setState(() {});
                widget.onSelected(value);
              }
            : null,
        hint: widget.hintText == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  widget.hintText!,
                  style: widget.hintStyle ?? textTheme.bodySmall!.withColor(AppColors.hint).spacing(-20),
                ),
              ),
      ),
    );
  }
}
