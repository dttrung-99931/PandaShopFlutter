
import 'package:flutter/material.dart';

class AppSliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  AppSliverPersistentDelegate({required this.child, required this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // shrinkOffset =  0 When category is still NOT pind
    // shrinkOffset !=  0 and increased, When category is still pind
    // log(shrinkOffset.toString());

    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
