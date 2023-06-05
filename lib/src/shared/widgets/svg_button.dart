import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatefulWidget {
  const SvgButton(this.path, {this.onTap, this.width, this.height, this.color, super.key});

  final String path;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;

  @override
  State<SvgButton> createState() => _SvgButtonState();
}

class _SvgButtonState extends State<SvgButton> {
  bool _isPressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() => _isPressing = true);
        widget.onTap?.call();
        await delayMilis(50);
        setState(() => _isPressing = false);
      },
      onPanStart: (_) => setState(() => _isPressing = true),
      onPanEnd: (_) => setState(() => _isPressing = false),
      child: SvgPicture.asset(
        widget.path,
        width: widget.width,
        height: widget.height,
        color: widget.color ?? (_isPressing ? EVMColors.blackLight.withOpacity(0.5) : null),
        colorBlendMode: _isPressing ? BlendMode.srcATop : BlendMode.srcIn,
        cacheColorFilter: true,
      ),
    );
  }
}
