import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BubbleAlignment { top, bottom }

class BubbleSpeechWidget extends StatelessWidget {
  const BubbleSpeechWidget(
      {required this.position, this.alignment = BubbleAlignment.bottom, required this.child, super.key});

  // Khoảng cách của tam giác so với cạnh trái của Container
  final double position;

  // Tam giác nằm trên hay dưới?
  final BubbleAlignment alignment;

  final Widget child;

  static final triangleSize = 40.w;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: EVMColors.grey2,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: EVMColors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: alignment == BubbleAlignment.bottom
              ? EdgeInsets.only(bottom: triangleSize - 1) // trừ 1 là để tam giác nằm sát Container hơn
              : EdgeInsets.only(top: triangleSize - 1),
          child: child,
        ),
        Positioned(
          top: alignment == BubbleAlignment.bottom ? null : 0,
          bottom: alignment == BubbleAlignment.bottom ? 0 : null,
          left: position,
          child: RotatedBox(
            quarterTurns: alignment == BubbleAlignment.bottom ? 2 : 0,
            child: CustomPaint(
              painter: TriangleCustomPainter(
                color: EVMColors.grey2,
                shadowColor: alignment == BubbleAlignment.bottom ? EVMColors.grey.withOpacity(0.5) : null,
                elevation: alignment == BubbleAlignment.bottom ? 5 : 0,
              ),
              size: Size(triangleSize, triangleSize),
            ),
          ),
        ),
      ],
    );
  }
}

class TriangleCustomPainter extends CustomPainter {
  const TriangleCustomPainter({
    required this.color,
    this.shadowColor,
    this.elevation = 0,
  });

  final Color color;
  final Color? shadowColor;
  final double elevation;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    final path = _getPath(size.width, size.height);
    if (shadowColor != null) {
      canvas.drawShadow(path, shadowColor!, elevation, false);
    }
    canvas.drawPath(path, paint);
  }

  Path _getPath(double x, double y) {
    return Path()
      ..moveTo(x * 0.4352439, y * 0.1295385)
      ..arcToPoint(
        Offset(x * 0.5647805, y * 0.1295385),
        radius: Radius.elliptical(x * 0.07317073, y * 0.07692308),
        rotation: 0,
        largeArc: false,
        clockwise: true,
      )
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..lineTo(x * 0.05636585, y * 0.8871795)
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
