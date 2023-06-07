import 'package:evievm_app/src/features/home/presentation/widgets/product/widgets/product_item.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_bloc/base_state.dart';
import '../../../../../shared/widgets/custom_bloc_builder.dart';
import '../../bloc/home_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : super(key: key);
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<HomeBloc>(
        buildForStates: const [LoadingState, ErrorState, GetHomeProductsSucess],
        builder: (state) {
          if (state is GetHomeProductsSucess) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              physics: physics,
              shrinkWrap: true,
              children: [...state.data.map((product) => ProductItem(product))],
            );
          }

          return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return const Padding(
              padding: EdgeInsets.all(64),
              child: LoadingWidget(),
            );
          });
        });
  }
}
