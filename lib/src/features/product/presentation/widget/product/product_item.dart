import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_dto.dart';
import 'package:evievm_app/src/features/product/presentation/screens/product_detail_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/price_widget.dart';
import 'package:evievm_app/src/shared/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../config/theme/app_theme.dart';

class ProductItem extends StatelessWidget {
  final ProductDto product;
  final Function(ProductDto product)? onPressed;

  const ProductItem(
    this.product, {
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Container(
        // padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
            2.shb,
            // TODO: hanlde responsive with other image sizes
            AspectRatio(
              aspectRatio: 1,
              child: !isNullOrEmpty(product.thumbnailUrl)
                  ? AppImage.network(
                      product.thumbnailUrl!,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(8.r),
                    )
                  : Assets.img.noImage.build(),
            ),
            4.shb,
            Expanded(
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            // Prices
            PriceWidget(product.price),
            PriceWidget(
              product.originalPrice,
              isOriginalPrice: true,
            ),
            4.shb,
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
              color: Colors.black26,
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
                  style: textTheme.labelLarge,
                ),
                const Spacer(),
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 12,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: product.isLoading ? Colors.grey : Colors.amber,
                  ),
                  onRatingUpdate: (_) {},
                ),
              ],
            ),
            2.shb,
          ],
        ).skeletonBy(product, context),
      ),
    );
  }

  void _onPressed() {
    if (onPressed != null) {
      onPressed!(product);
    } else {
      Global.pushNamed(
        ProductDetailScreen.router,
        args: ProductDetailScreenArgs(product.id),
      );
    }
  }
}
