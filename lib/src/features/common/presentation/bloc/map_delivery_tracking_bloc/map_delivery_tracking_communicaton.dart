import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_bloc.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/panda_map.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class MapDeliveryTrackingCommunication extends BlocCommunication<MapDeliveryTrackingBloc> {
  @override
  void startCommunication(MapDeliveryTrackingBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<SignalRBloc>(
      (state) {
        if (state is SinalRDeliveryProgressUpdate &&
            bloc.currentTrackingDelivery == state.progressUpdate.id &&
            PandaMap.isInitilized) {
          bloc.add(OnMapDeliveryProgressUpdate(state.progressUpdate));
        }
      },
    );
  }
}
