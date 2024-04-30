import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../config/theme/app_theme.dart';

class SearchBar extends StatelessWidget {
  final String? navigateToScreenOnPressed;
  final bool autoFocus;
  final TextEditingController controller;
  final void Function(String? text)? onSearch;
  final void Function(String? text)? onTextChanged;
  final String hint;

  SearchBar({
    Key? key,
    TextEditingController? controller,
    this.navigateToScreenOnPressed,
    this.autoFocus = false,
    this.onSearch,
    this.onTextChanged,
    this.hint = 'Tên sản phẩm, tên shop...',
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        onEditingComplete: () {
          onSearch?.call(controller.text);
        },
        onChanged: onTextChanged,
        onTap: navigateToScreenOnPressed != null ? _onPressed : null,
        autofocus: autoFocus,
        readOnly: navigateToScreenOnPressed != null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black45,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 36,
            minWidth: 36,
          ),
          isDense: true,
          hintText: hint,
          hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.black.withOpacity(.5)),
        ),
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal, color: AppColors.black.withOpacity(.9)),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  void _onPressed() {
    if (Global.currentRoute != navigateToScreenOnPressed) {
      Global.pushNamed(navigateToScreenOnPressed!);
    }
  }
}
