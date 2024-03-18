import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ProductOptionCommunication extends BlocCommunication<ProductOptionBloc> {
  @override
  void startCommunication(ProductOptionBloc bloc) {
    listenOtherBloc<ProductDetailBloc>((state) {
      if (state is GetProductDetailSucess && state.data != null) {
        bloc.add(
          OnInitProductOption(
            productDetail: state.data!,
            selectedOptionId: state.selectedOptionId,
          ),
        );
      }
    });
  }
}
