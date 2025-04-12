import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HiddenOnSrollWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Widget child;
  final double? height;
  final int animateDurationInMinlis;

  const HiddenOnSrollWidget({
    required this.scrollController,
    required this.child,
    super.key,
    this.height,
    this.animateDurationInMinlis = 200,
  });

  @override
  State<HiddenOnSrollWidget> createState() => _HiddenOnSrollWidgetState();
}

class _HiddenOnSrollWidgetState extends State<HiddenOnSrollWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isShown = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animateDurationInMinlis),
      value: 1, // shown child on init
    );
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) {
      return;
    }
    var direction = widget.scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && _isShown) {
      _animationController.reverse();
      _isShown = false;
    }

    if (direction == ScrollDirection.forward && !_isShown) {
      _animationController.forward();
      _isShown = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: _animationController,
      child: SizedBox(
        height: widget.height,
        child: widget.child,
      ),
    );
  }
}
