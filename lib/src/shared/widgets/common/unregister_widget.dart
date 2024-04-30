// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter/material.dart';

class UnregisterWidget extends StatelessWidget {
  const UnregisterWidget({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String buttonTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        16.shb,
        Text(title, style: textTheme.bodyLarge),
        16.shb,
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          title: buttonTitle,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
