import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/price_widget.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: Dimensions.paddingAll.copyWith(top: 16.h, bottom: 16.h),
        color: EVMColors.white,
        child: Column(
          children: [
            Text(
              productDetail.name,
              style: textTheme.titleSmall?.copyWith(color: EVMColors.black),
              textAlign: TextAlign.center,
            ),
            CustomBlocBuilder<ProductOptionBloc>(
                buildForStates: const [OptionSelectedChanged],
                builder: (state) {
                  if (state is OptionSelectedChanged && state.selectedOption != null) {
                    return Column(
                      children: [
                        4.shb,
                        PriceWidget(state.selectedOption!.price, isLarge: true),
                        Row(
                          children: [
                            8.swb,
                            const Text('Kho: '),
                            Text('${state.selectedOption!.remainingNum}', style: textTheme.bodyMedium.bold()),
                          ],
                        )
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }),
          ],
        ),
      ),
    );
  }
}
