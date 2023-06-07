import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_bloc/base_state.dart';
import '../../../../../shared/widgets/custom_bloc_builder.dart';
import '../../bloc/home_bloc.dart';
import 'widgets/product_item.dart';

class ProductSliverGrid extends StatelessWidget {
  const ProductSliverGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<HomeBloc>(
        initialEvent: OnGetHomeProducts(),
        buildForStates: const [LoadingState, ErrorState, GetHomeProductsSucess],
        isSliver: true,
        builder: (state) {
          if (state is GetHomeProductsSucess) {
            return SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [...state.data.map((product) => ProductItem(product))],
            );
          }

          return SliverToBoxAdapter(
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return const LoadingWidget();
            }),
          );
        });
  }
}
