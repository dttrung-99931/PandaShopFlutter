import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

class AppCustomCheckBox extends StatelessWidget {
  final void Function(bool isChecked) onChanged;
  final bool isChecked;
  final String title;
  const AppCustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.isChecked,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Transform.translate(
        offset: const Offset(-8, 0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(color: AppColors.border, width: 1),
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                value: isChecked,
                onChanged: (isChecked) {
                  onChanged(isChecked ?? false);
                },
              ),
            ),
            Text(
              tr(title),
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
