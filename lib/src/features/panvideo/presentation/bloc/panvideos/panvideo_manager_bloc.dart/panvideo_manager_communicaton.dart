import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class PanvideoManagerCommunication extends BlocCommunication<PanvideoManagerBloc> {
  @override
  void startCommunication(PanvideoManagerBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<PanVideoBloc>((state) {
      if (state is GetPanvideosSuccess) {
        bloc.add(OnPanvideosAdded(panvideos: [...state.data]));
      }
    });
  }
}
