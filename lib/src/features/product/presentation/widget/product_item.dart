import 'package:evievm_app/core/utils/assets/assets.dart';
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
  final Function(ProductDto product)? onPressed;

  const ProductItem(
    this.product, {
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null
          ? () {
              onPressed?.call(product);
            }
          : () {
              Global.pushNamed(
                ProductDetailScreen.router,
                args: ProductDetailScreenArgs(product.id),
              );
            },
      child: Container(
        // padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.5,
              color: AppColors.primary.withOpacity(.4),
              blurRadius: 1,
            )
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: hanlde responsive with other image sizes
            Expanded(
              flex: 5,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: product.thumbnailUrl != null
                      ? ExtendedImage.network(
                          alignment: Alignment.center,
                          product.thumbnailUrl!,
                          fit: BoxFit.scaleDown,
                        )
                      : Assets.img.noImage.build(),
                ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PriceWidget(product.price),
                PriceWidget(
                  product.originalPrice,
                  isOriginalPrice: true,
                ),
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
