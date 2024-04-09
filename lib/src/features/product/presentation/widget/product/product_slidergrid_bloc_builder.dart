import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_slidergrid.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_bloc/base_state.dart';
import '../../../../../shared/widgets/custom_bloc_builder.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';

class ProductSliverGridBlocBuilder<TBLoc extends BaseBloc> extends StatelessWidget {
  final BaseEvent? inititalEvent;

  const ProductSliverGridBlocBuilder({Key? key, this.inititalEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<TBLoc>(
        initialEvent: inititalEvent,
        buildForStates: const [LoadingState, ErrorState, GetProductsSucess],
        isSliver: true,
        builder: (state) {
          if (state is GetProductsSucess) {
            return ProductSliverGrid(state.data);
          }

          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        });
  }
}
