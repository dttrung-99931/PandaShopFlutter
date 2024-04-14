import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';
import 'payment_method_inp/payment_method_inp_bloc.dart';

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
    listenOtherBloc<PaymentMethodInpBloc>((state) {
      if (state is GetPaymentMethodsSuccess && state.selected != null) {
        bloc.add(OnChangePaymentMethod(paymentMethod: state.selected!));
      }
    });
  }

  @override
  void stopCommunication() {
    getIt.resetLazySingleton<DeliveryMethodInpBloc>();
    getIt.resetLazySingleton<PaymentMethodInpBloc>();
    super.stopCommunication();
  }
}
