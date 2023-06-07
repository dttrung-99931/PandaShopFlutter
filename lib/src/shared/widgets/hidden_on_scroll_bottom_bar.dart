import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HiddenOnSrollWidget extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;
  final ValueNotifier<bool> _visible = ValueNotifier<bool>(true);
  final double height;
  final int animateDurationInMinlis;

  HiddenOnSrollWidget(
    this.scrollController, {
    required this.child,
    Key? key,
    this.height = kBottomNavigationBarHeight,
    this.animateDurationInMinlis = 500,
  }) : super(key: key) {
    scrollController.addListener(
      () {
        var direction = scrollController.position.userScrollDirection;
        if (direction == ScrollDirection.reverse && _visible.value) {
          _visible.value = false;
        }

        if (direction == ScrollDirection.forward && !_visible.value) {
          _visible.value = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _visible,
      builder: (context, bool value, _) => AnimatedContainer(
        duration: Duration(milliseconds: animateDurationInMinlis),
        height: value ? height : 0,

        // Wrap [child] with SingleChildScrollView to ignore overflow warnings
        // when this resizes with animation
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
