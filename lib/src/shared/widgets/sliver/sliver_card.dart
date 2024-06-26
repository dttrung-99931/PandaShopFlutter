// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../my_card.dart';

class SliverCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsets padding;
  const SliverCard({
    super.key,
    required this.child,
    this.elevation = 2,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MyCard(
        elevation: elevation,
        padding: padding,
        child: child,
      ),
    );
  }
}
