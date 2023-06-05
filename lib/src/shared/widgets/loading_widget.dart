import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({this.size, this.color, Key? key}) : super(key: key);

  final double? size;
  final Color? color;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: 2.seconds,
    vsync: this,
  )..repeat();

  final Tween<double> turnsTween = Tween<double>(begin: 0, end: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: turnsTween.animate(_controller),
        child: SvgPicture.asset(
          Assets.ic.loading,
          width: widget.size ?? 40.r,
          fit: BoxFit.fitWidth,
          color: widget.color,
        ),
      ),
    );
  }
}
