import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProcessAndProcessGroupName extends StatelessWidget {
  const ProcessAndProcessGroupName({
    super.key,
    required this.processName,
    required this.processGroupName,
    this.nameFontWeight = FontWeight.normal,
  });
  final String processName;
  final String processGroupName;
  final FontWeight nameFontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: EVMColors.border),
          ),
          child: Text(
            processGroupName,
            style: textTheme.labelMedium?.copyWith(fontWeight: nameFontWeight).bold(),
          ),
        ),
        Text(
          processName,
          style: textTheme.titleSmall?.copyWith(overflow: TextOverflow.ellipsis, height: 1.35),
          maxLines: 1,
        ),
      ],
    );
  }
}
