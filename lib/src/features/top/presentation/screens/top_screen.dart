import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  static const router = '/top';
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOpScren'),
      ),
    );
  }
}
