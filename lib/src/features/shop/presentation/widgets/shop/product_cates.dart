import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/product/product_cates.dart';
import 'package:flutter/material.dart';

class ShopProductCates extends StatefulWidget {
  const ShopProductCates({super.key});

  @override
  State<ShopProductCates> createState() => _ShopProductCatesState();
}

class _ShopProductCatesState extends State<ShopProductCates> {
  @override
  void initState() {
    super.initState();
    shopProductBloc.add(OnGetShopProductCates());
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ShopProductBloc>(
      buildForStates: const [GetShopProductCatesSucess],
      loadingStateType: LoadingShopProductCates,
      loadingWidgetBuilder: () {
        return ProductCates(
          cates: List.generate(4, (_) => ProductCategoryDto.loading),
        ).skeleton(true, context);
      },
      builder: (state) {
        if (state is! GetShopProductCatesSucess) {
          return const SizedBox();
        }
        return ProductCates(cates: state.data);
      },
    );
  }
}
