import 'dart:math';

import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductCates extends StatefulWidget {
  const ProductCates({super.key});

  @override
  State<ProductCates> createState() => _ProductCatesState();
}

class _ProductCatesState extends State<ProductCates> {
  final HomeBloc _homeBloc = getIt();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(OnGetHomeProductCates());
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<HomeBloc>(
      buildForStates: const [GetProductCatesSucess],
      builder: (state) {
        if (state is! GetProductCatesSucess) {
          return const SizedBox();
        }
        return _ProductCates(cates: state.data);
      },
    );
  }
}

class _ProductCates extends StatelessWidget {
  const _ProductCates({
    Key? key,
    required this.cates,
  }) : super(key: key);
  int get menuItemsCount => cates.length;
  final int rows = 2;
  final List<ProductCategoryDto> cates;

  @override
  Widget build(BuildContext context) {
    int columns = (menuItemsCount / rows).floor() +
        // plus 1 col if there's last odd items
        (menuItemsCount % rows != 0 ? 1 : 0);
    return Container(
      height: _itemHeight * rows + 44.h,
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
                _Item(cates: cates, menuIndex: menuIndex),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 4.w);
        },
      ),
    );
  }
}

double get _itemHeight => 72.h;

class _Item extends StatelessWidget {
  const _Item({
    required this.cates,
    required this.menuIndex,
  });

  final List<ProductCategoryDto> cates;
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _itemHeight,
      width: 64.w,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                  width: 28,
                  height: 28,
                )
              : emptyWidget,
          // const Spacer(),
          sh(8.h),
          Expanded(
            child: Text(
              cates[menuIndex].name,
              style: textTheme.labelMedium?.copyWith(height: 1.3),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
