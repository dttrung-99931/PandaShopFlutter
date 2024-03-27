import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ProductOptionsInputCommunication extends BlocCommunication<ProductOptionsInputBloc> {
  @override
  void startCommunication(ProductOptionsInputBloc bloc) {
    // listenOtherBloc<ProductPropertiesInputBloc>((state) {
    //   if (state is! ProductPropsUpdated) {
    //     return;
    //   }
    // });
  }
}
