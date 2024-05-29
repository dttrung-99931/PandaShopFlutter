// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CenterSingleChildScrollView extends StatelessWidget {
  const CenterSingleChildScrollView({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: child),
    );
  }
}
