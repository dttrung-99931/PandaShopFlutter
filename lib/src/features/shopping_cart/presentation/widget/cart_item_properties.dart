import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemProperties extends StatelessWidget {
  const CartItemProperties({
    super.key,
    required this.item,
  });

  final CartItemDto item;

  @override
  Widget build(BuildContext context) {
    return SpacingRow(
      spacing: 6.w,
      children: item.prouductOption.propertyValues.mapList(
        (PropertyValueDto element) => AppChip(
          label: element.value,
          isSelected: true,
          verticalPadding: 3.h,
          horizontalPadding: 8.w,
          fontSize: textTheme.bodySmall!.fontSize,
        ),
      ),
    );
  }
}
