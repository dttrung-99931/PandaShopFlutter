import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverlayButton extends StatefulWidget {
  const OverlayButton({
    this.enabled = true,
    required this.button,
    required this.overlay,
    this.level = 1,
    this.offset,
    this.onTap,
    super.key,
  });

  final bool enabled;
  final Widget button;
  final Widget overlay;
  final int level;
  final Offset? offset;
  final bool Function()? onTap;

  @override
  State<OverlayButton> createState() => _OverlayButtonState();
}

class _OverlayButtonState extends State<OverlayButton> {
  final _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
                final bool isToggle = widget.onTap?.call() ?? true;
                if (isToggle) _toggleOverlay();
              }
            : null,
        child: widget.button,
      ),
    );
  }

  void _toggleOverlay() {
    while (Global.overlayEntries.length >= widget.level) {
      Global.overlayEntries.removeLast().remove();
    }
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        child: CompositedTransformFollower(
          offset: widget.offset ?? Offset(0, 45.h),
          link: _layerLink,
          showWhenUnlinked: false,
          child: widget.overlay,
        ),
      ),
    );
    Global.overlayEntries.add(entry);
    Overlay.of(context).insert(entry);
  }
}
