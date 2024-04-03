import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/cart_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../shared/widgets/banner_slider.dart';
import '../../../../shared/widgets/search_bar.dart';

class SearchBarAndBanner extends StatefulWidget {
  const SearchBarAndBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SearchBarAndBanner> createState() => _SearchBarAndBannerState();
}

class _SearchBarAndBannerState extends State<SearchBarAndBanner> {
  @override
  void initState() {
    homeBloc.add(OnGetHomeBanners());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: CustomBlocBuilder<HomeBloc>(
          buildForStates: const [GetHomeBannersSucess],
          builder: (state) {
            if (state is! GetHomeBannersSucess) {
              return emptyWidget;
            }
            return BannerSlider(images: state.data);
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
      backgroundColor: AppColors.primary,
      title: SearchBar(
        autoFocus: true,
        navigateToScreenOnPressed: SearchProductsScreen.router,
      ),
      actions: [
        Center(child: CartButton(size: 32.r)),
        sw(12.w),
      ],
    );
  }
}
