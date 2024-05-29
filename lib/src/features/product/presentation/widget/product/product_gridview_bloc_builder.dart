import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product/product_gridview.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/widgets/custom_bloc_builder.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';

class ProductGridViewBlocBuilder<TBLoc extends BaseBloc> extends StatelessWidget {
  final BaseEvent? inititalEvent;

  const ProductGridViewBlocBuilder({super.key, this.inititalEvent});

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<TBLoc>(
        initialEvent: inititalEvent,
        buildForStates: const [GetProductsSucess],
        isSliver: true,
        builder: (state) {
          if (state is GetProductsSucess) {
            return ProductGridView(state.data, physics: const NeverScrollableScrollPhysics());
          }

          return const SizedBox.shrink();
        });
  }
}
