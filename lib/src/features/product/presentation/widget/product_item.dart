import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/price_widget.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme.dart';

class ProductItem extends StatelessWidget {
  final ProductDto product;

  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Global.pushNamed(
          ProductDetailScreen.router,
          args: ProductDetailScreenArgs(product.id),
        );
      },
      child: Container(
        // padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: hanlde responsive with other image sizes
            Expanded(
              flex: 5,
              child: ExtendedImage.network(
                product.thumbnailUrl,
                fit: BoxFit.scaleDown,
                // layoutInsets: EdgeInsets.all(2.r),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if (product.price < product.originalPrice)
                PriceWidget(
                  product.originalPrice,
                  isOriginalPrice: true,
                ),
                PriceWidget(product.price),
              ],
            ),
            sh(4.h),
            // TODO:
            Align(
              alignment: Alignment.centerRight,
              child: Text('Đã bán: 2k', style: textTheme.labelMedium?.copyWith(color: EVMColors.sellNumber)),
            ),

            // const SizedBox(height: 8),
            const Divider(
              indent: 0,
              endIndent: 0,
              height: 16,
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.delivery_dining,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'HCM 1d',
                  style: textTheme.bodySmall,
                ),
                const Spacer(),
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 12,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (_) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
