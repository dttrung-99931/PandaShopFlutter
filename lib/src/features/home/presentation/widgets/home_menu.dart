import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../core/utils/app_colors.dart';

class HomeMenu extends StatelessWidget {
  // static final menus = [

  // ]
  const HomeMenu({
    Key? key,
  }) : super(key: key);
  final int menuItemsCount = 18;
  final int rows = 2;

  @override
  Widget build(BuildContext context) {
    int columns = (menuItemsCount / rows).floor() +
        // plus 1 col if there's last odd items
        (menuItemsCount % rows != 0 ? 1 : 0);
    return SliverToBoxAdapter(
      child: Container(
        height: 180,
        color: AppColors.white,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          itemCount: columns,
          itemBuilder: (BuildContext context, int colIndex) {
            int fromIndex = colIndex * rows;
            int toIndex = min(fromIndex + rows - 1, menuItemsCount - 1);
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int menuIndex = fromIndex; menuIndex <= toIndex; menuIndex++)
                  Container(
                    height: 64,
                    width: 64,
                    margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          // offset: Offset(1, 3),
                          spreadRadius: 1,
                          color: Colors.black12,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.ac_unit,
                      color: AppColors.primary,
                    ),
                  ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8);
          },
        ),
      ),
    );
  }
}
