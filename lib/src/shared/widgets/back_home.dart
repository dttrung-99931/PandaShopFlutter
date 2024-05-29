import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/material.dart';

class BackHome extends StatelessWidget {
  const BackHome({
    super.key,
    this.pageText = "",
  });

  final String pageText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: EVMColors.white,
          onPressed: () {
            // back to home screen
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   HomePage.route,
            //   (route) => false,
            // );
          },
        ),
        Text(
          pageText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: EVMColors.white,
          ),
        ),
      ],
    );
  }
}
