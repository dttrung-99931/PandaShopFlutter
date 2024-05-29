import 'dart:math';

import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductCates extends StatelessWidget {
  const ProductCates({
    super.key,
    required this.cates,
  });
  int get menuItemsCount => cates.length;
  final int perRow = 5;
  int get rows {
    int r = (cates.length.toDouble() / perRow).ceil();
    return cates.length ~/ perRow >= 1 ? r : max(1, r);
  }

  final List<ProductCategoryDto> cates;

  @override
  Widget build(BuildContext context) {
    int columns = (menuItemsCount / rows).floor() +
        // plus 1 col if there's last odd items
        (menuItemsCount % rows != 0 ? 1 : 0);
    return Container(
      height: _height * rows + 24.h,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int menuIndex = fromIndex; menuIndex <= toIndex; menuIndex++)
                _Item(cates: cates, menuIndex: menuIndex),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8.r);
        },
      ),
    );
  }
}

double get _height => 102.r;
double get _width => 100.r;

class _Item extends StatelessWidget {
  const _Item({
    required this.cates,
    required this.menuIndex,
  });

  final List<ProductCategoryDto> cates;
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: _width,
        margin: EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 4.r),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(2.r),
          boxShadow: [
            BoxShadow(
              // offset: Offset(1, 3),
              spreadRadius: 1,
              color: AppColors.primary.withOpacity(.4),
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            cates[menuIndex].imgLink != null
                ? ExtendedImage.network(
                    cates[menuIndex].imgLink!,
                    fit: BoxFit.contain,
                    width: 40.r,
                    height: 40.r,
                  )
                : emptyWidget,
            // const Spacer(),
            sh(8.h),
            Expanded(
              child: Text(
                cates[menuIndex].name,
                style: textTheme.labelMedium?.copyWith(height: 1.3),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
