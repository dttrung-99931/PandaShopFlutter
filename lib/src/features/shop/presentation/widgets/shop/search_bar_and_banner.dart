import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../shared/widgets/search_bar.dart';

class ShopSearchBarAndBanner extends StatefulWidget {
  const ShopSearchBarAndBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ShopSearchBarAndBanner> createState() => _ShopSearchBarAndBannerState();
}

class _ShopSearchBarAndBannerState extends State<ShopSearchBarAndBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: CustomBlocBuilder<HomeBloc>(
          buildForStates: const [GetHomeBannersSucess],
          builder: (state) {
            // if (state is! GetHomeBannersSucess) {
            //   return emptyWidget;
            // }
            // return BannerSlider(images: state.data);
            return Container(color: AppColors.primaryShop);
          },
        ),
        centerTitle: true,
        expandedTitleScale: 1,
        collapseMode: CollapseMode.pin,
      ),
      stretchTriggerOffset: 56,
      // collapsedHeight: 96, // hight when pined
      expandedHeight: 180,
      pinned: true,
      backgroundColor: AppColors.blue2,
      title: SearchBar(
        autoFocus: true,
        navigateToScreenOnPressed: SearchProductsScreen.router,
        hint: 'Tìm sản phầm trong shop của bạn',
      ),
    );
  }
}
