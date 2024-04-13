import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class OrderBlocCommunication extends BlocCommunication<OrderBloc> {
  @override
  void startCommunication(OrderBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<DeliveryMethodInpBloc>((state) {
      if (state is GetShopOrderDeliveryMethodsSuccess && state.selected != null) {
        bloc.add(OnChangeDeliveryMethod(deliveryMethod: state.selected!, shop: state.shop));
      }
    });
  }

  @override
  void stopCommunication() {
    getIt.resetLazySingleton<DeliveryMethodInpBloc>();
    super.stopCommunication();
  }
}
