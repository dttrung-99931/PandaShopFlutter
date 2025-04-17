import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class PanvideoManagerCommunication extends BlocCommunication<PanvideoManagerBloc> {
  final bufferConfig = const BetterPlayerBufferingConfiguration(
    bufferForPlaybackMs: 2 * 1000,
    bufferForPlaybackAfterRebufferMs: 3 * 1000,
  );

  @override
  void startCommunication(PanvideoManagerBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<PanVideoBloc>((state) {
      if (state is GetPanvideosSuccess) {
        final datasources = state.data.mapList(
          (e) => BetterPlayerDataSource.network(
            e.videoUrl,
            cacheConfiguration: BetterPlayerCacheConfiguration(
              key: e.videoUrl,
              useCache: true,
            ),
            bufferingConfiguration: bufferConfig,
          ),
        );
        bloc.add(OnAddPanvideoDatasources(datasources: datasources));
      }
    });
  }
}
