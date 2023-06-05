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
  final bool initSelectedItem;

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
    this.initSelectedItem = true,
  }) : super(key: key);

  @override
  State<CustomDropdownButton<T>> createState() => _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  T? _selectedItem;

  @override
  void initState() {
    _selectedItem =
        widget.selectedItem ?? (widget.initSelectedItem && widget.dataItems.isNotEmpty ? widget.dataItems.first : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: EVMColors.border),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor,
      ),
      child: DropdownButton<T>(
        value: _selectedItem,
        isExpanded: true,
        iconEnabledColor: EVMColors.primary,
        iconDisabledColor: EVMColors.divider,
        iconSize: 36,
        underline: const SizedBox.shrink(),
        items: widget.dataItems
            .map(
              (T value) => DropdownMenuItem<T>(
                value: value,
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
                  style: widget.hintStyle ?? textTheme.bodySmall!.withColor(EVMColors.hint).spacing(-20),
                ),
              ),
      ),
    );
  }
}
