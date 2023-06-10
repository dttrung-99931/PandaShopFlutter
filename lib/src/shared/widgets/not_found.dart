import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final bool isSliver;

  const NotFound({
    super.key,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    var widget = const Center(child: Text('Không tìm thấy sản phẩm'));
    return isSliver ? SliverFillRemaining(child: widget) : widget;
  }
}
