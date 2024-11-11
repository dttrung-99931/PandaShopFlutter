import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShopOrderBlocCommunication extends BlocCommunication<ShopOrderBloc> {
  @override
  void startCommunication(ShopOrderBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<SignalRBloc>(
      (state) {
        if (state is SinalRDeliveryProgressUpdate) {}
      },
    );
  }
}
