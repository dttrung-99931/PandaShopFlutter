import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_category_dto.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/product/product_cates.dart';
import 'package:flutter/material.dart';

class HomeProductCates extends StatefulWidget {
  const HomeProductCates({super.key});

  @override
  State<HomeProductCates> createState() => _HomeProductCatesState();
}

class _HomeProductCatesState extends State<HomeProductCates> {
  final HomeBloc _homeBloc = getIt();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(OnGetHomeProductCates());
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<HomeBloc>(
      buildForStates: const [GetProductCatesSucess],
      loadingWidgetBuilder: () {
        return ProductCates(
          cates: List.generate(10, (_) => ProductCategoryDto.loading),
        );
      },
      builder: (state) {
        if (state is! GetProductCatesSucess) {
          return const SizedBox();
        }
        return ProductCates(cates: state.data);
      },
    );
  }
}
