import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PanvideoScreen extends StatefulWidget {
  static const router = '/panvideo';

  const PanvideoScreen({super.key});

  @override
  State<PanvideoScreen> createState() => _PanvideoScreenState();
}

class _PanvideoScreenState extends State<PanvideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Container(
          child: const Column(
            children: [
              // Add your widgets here
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          backgroundColor: AppColors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
