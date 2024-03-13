import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.45,
              child: TextButton(
                onPressed: () {},
                child: Text("Xem thêm", style: textTheme.bodyLarge),
              ),
            ),
            Expanded(
              child: ClipPath(
                clipper: _CustomClipPath(),
                child: Container(
                  color: AppColors.primary,
                  margin: const EdgeInsets.all(4),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Đặt hàng",
                      style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(24, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}
