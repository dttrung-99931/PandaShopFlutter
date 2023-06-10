import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/src/features/product/presentation/widget/product_gridview.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_bloc_builder.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

class ProductGridViewBlocBuilder<TBLoc extends BaseBloc> extends StatelessWidget {
  final BaseEvent? inititalEvent;

  const ProductGridViewBlocBuilder({Key? key, this.inititalEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<TBLoc>(
        initialEvent: inititalEvent,
        buildForStates: const [GetProductsSucess],
        isSliver: true,
        builder: (state) {
          if (state is GetProductsSucess) {
            return ProductGridView(state.data);
          }

          return const SizedBox.shrink();
        });
  }
}
