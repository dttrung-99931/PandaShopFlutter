import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HiddenOnSrollWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Widget child;
  final double? height;
  final int animateDurationInMinlis;

  const HiddenOnSrollWidget({
    required this.scrollController,
    required this.child,
    Key? key,
    this.height,
    this.animateDurationInMinlis = 500,
  }) : super(key: key);

  @override
  State<HiddenOnSrollWidget> createState() => _HiddenOnSrollWidgetState();
}

class _HiddenOnSrollWidgetState extends State<HiddenOnSrollWidget> {
  final ValueNotifier<bool> _visible = ValueNotifier<bool>(true);

  @override
  void initState() {
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) {
      return;
    }
    var direction = widget.scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && _visible.value) {
      _visible.value = false;
    }

    if (direction == ScrollDirection.forward && !_visible.value) {
      _visible.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _visible,
      builder: (context, bool value, _) => IntrinsicHeight(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: widget.animateDurationInMinlis),
            height: value ? widget.height : 0,
            child: SingleChildScrollView(child: widget.child),
          ),
        ),
      ),
    );
  }
}
