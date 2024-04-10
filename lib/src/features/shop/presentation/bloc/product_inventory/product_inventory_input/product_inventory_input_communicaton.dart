import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ProductInventoryInputCommunication extends BlocCommunication<ProductBatchInputBloc> {
  @override
  void startCommunication(ProductBatchInputBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<ProductBatchInputBloc>((state) {
      if (state is ProductBatchAdded) {
        bloc.add(OnProductBatchAdded(productBatch: state.data));
      }
    });
  }

  @override
  void stopCommunication() {
    super.stopCommunication();
    getIt.resetLazySingleton<ProductBatchInputBloc>();
  }
}
