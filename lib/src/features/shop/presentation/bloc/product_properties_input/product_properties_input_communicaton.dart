import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ProductPropertiesInputCommunication extends BlocCommunication<ProductPropertiesInputBloc> {
  @override
  void startCommunication(ProductPropertiesInputBloc bloc) {
    listenOtherBloc<ProductCateInputBloc>((state) {
      if (state is GetProductCatesSelectSucess && state.selected != null && state.selected!.level == 3) {
        bloc.add(OnGetPropertyTemplateOfCate(cateId: state.selectedId!));
      }
    });

    listenOtherBloc<ProductOptionsInputBloc>((state) {
      if (state is OptionPropsUpdated) {
        bloc.add(OnOptionPropsUpdated(optionPropUpdated: state));
      }
    });
  }
}
