import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionAndProperties extends StatelessWidget {
  const ProductDescriptionAndProperties({
    super.key,
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverSection(
      title: 'Thông tin sản phẩm',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productDetail.description, style: textTheme.bodyLarge),
          if (productDetail.propertyValues.isNotEmpty) ...[
            sh(16.h),
            Text(
              'Thông số',
              style: textTheme.bodyLarge?.copyWith(color: EVMColors.black.withOpacity(.8)),
            ),
            sh(4.h),
            ...productDetail.propertyValues.map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  children: [
                    Text(e.name, style: textTheme.bodyMedium?.semibold()),
                    const Spacer(),
                    Text(e.value, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
