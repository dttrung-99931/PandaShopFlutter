import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  const Retry({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Something happen'),
        TextButton(onPressed: onRetry, child: const Text('Retry'))
      ],
    );
  }
}
