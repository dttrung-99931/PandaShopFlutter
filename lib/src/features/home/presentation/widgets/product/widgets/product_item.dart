import 'package:cached_network_image/cached_network_image.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';
import 'package:evievm_app/src/features/home/presentation/widgets/product/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../config/theme.dart';

class ProductItem extends StatelessWidget {
  final ProductDto product;

  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: product.thumbnailUrl,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            PriceWidget(product.price),
            PriceWidget(
              product.originalPrice,
              isOriginalPrice: true,
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
                  '1d giao hàng',
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
