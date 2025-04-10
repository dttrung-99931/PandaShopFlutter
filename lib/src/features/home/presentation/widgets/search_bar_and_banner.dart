import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/screens/search_products_screen.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/cart_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/search_bar.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/banner_slider.dart';

class SearchBarAndBanner extends StatefulWidget {
  const SearchBarAndBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SearchBarAndBanner> createState() => _SearchBarAndBannerState();
}

class _SearchBarAndBannerState extends State<SearchBarAndBanner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: BannerSlider.slideDuration,
  );
  late Animation<Color?> _bgAnim = _getColorTween();

  Animation<Color?> _getColorTween({
    Color? begin,
    Color? end,
  }) {
    return ColorTween(
      begin: begin,
      end: end,
    ).animate(_controller);
  }

  @override
  void initState() {
    homeBloc.add(OnGetHomeBanners());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: CustomBlocBuilder<HomeBloc>(
            buildForStates: const [GetHomeBannersSucess],
            builder: (state) {
              if (state is! GetHomeBannersSucess) {
                return emptyWidget;
              }
              return BannerSlider(
                images: state.data,
                onPageChanged: (index, reason) {
                  final beginColor = state.data[(index - 1) % state.data.length].avgColor;
                  final endColor = state.data[index].avgColor;
                  _bgAnim = _getColorTween(
                    begin: beginColor,
                    end: endColor,
                  );
                  _controller.forward(from: 0);
                },
              );
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
        backgroundColor: _bgAnim.value,
        title: AppSearchBar(
          autoFocus: true,
          navigateToScreenOnPressed: SearchProductsScreen.router,
        ),
        actions: [
          Center(child: CartButton(size: 32.r)),
          sw(12.w),
        ],
      ),
    );
  }
}
