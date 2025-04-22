// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:evievm_app/core/utils/utils.dart';
import 'package:flutter/material.dart';

/// Widget that showing child then hidding after [hiddenAfter] duration animately
class DelayedHiddenWidget extends StatefulWidget {
  const DelayedHiddenWidget({
    super.key,
    this.hiddenAfter = const Duration(milliseconds: 600),
    required this.child,
    required this.onCompleteHidden,
  });
  final Duration hiddenAfter;
  final Widget child;
  final void Function()? onCompleteHidden;

  @override
  State<DelayedHiddenWidget> createState() => _DelayedHiddenWidgetState();
}

class _DelayedHiddenWidgetState extends State<DelayedHiddenWidget> {
  bool _isVisible = true;
  Timer? _timer;

  @override
  void initState() {
    _makeVisibleThenHidden();
    super.initState();
  }

  void _makeVisibleThenHidden() {
    _isVisible = true;
    doOnBuildUICompleted(_scheduleHidding);
  }

  void _scheduleHidding() {
    _timer?.cancel();
    _timer = Timer(widget.hiddenAfter, () {
      if (mounted) {
        _isVisible = false;
        setState(() {});
        widget.onCompleteHidden?.call();
      }
    });
  }

  @override
  void didUpdateWidget(covariant DelayedHiddenWidget oldWidget) {
    _makeVisibleThenHidden();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1 : 0,
      duration: widget.hiddenAfter,
      child: widget.child,
    );
  }
}
