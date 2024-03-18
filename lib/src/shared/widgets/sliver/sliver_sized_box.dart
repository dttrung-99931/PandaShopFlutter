import 'package:flutter/cupertino.dart';

class SliverSizedBox extends StatelessWidget {
  final double? height;
  final double? width;

  const SliverSizedBox({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
