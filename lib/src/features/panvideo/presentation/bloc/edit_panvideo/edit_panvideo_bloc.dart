// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_video_player/awesome_video_player.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/edit_panvideo_usecase.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

part 'edit_panvideo_event.dart';
part 'edit_panvideo_state.dart';

EditPanVideoBloc get editPanVideoBloc => getIt<EditPanVideoBloc>();

@lazySingleton
class EditPanVideoBloc extends PanvideoManagerBloc with DisposableMixin {
  final PanMusicPlayer _panMusicPlayer;
  final EditPanVideoUsecase _integratePanMusicUsecase;
  PanMusicDto? _panMusic;

  /// Remove communication of parent which is used for panvideo feed feature
  /// TODO: make PanvideoManagerBloc abstract class,
  /// create separated FeedPanvideoManagerBloc for feed
  @override
  BlocCommunication? get blocCommunication => null;

  EditPanVideoBloc(this._panMusicPlayer, super.panvideoManager, this._integratePanMusicUsecase) : super() {
    on<OnInitPanMusic>(_onInitPanMusic);
  }

  Future<void> _onInitPanMusic(OnInitPanMusic event, Emitter<BaseState> emit) async {
    _panMusic = event.music;
    await _panMusicPlayer.setPanMusicSource(_panMusic!);
    await _panMusicPlayer.pause();
    await _panMusicPlayer.seekTo(Duration.zero);
  }

  @override
  void onTransition(Transition<BaseEvent, BaseState> transition) {
    switch (transition.currentState) {
      case (InitVideoControllerSuccess state):
        state.controller.removeEventsListener(_panvideoEventListener);
        state.controller.addEventsListener(_panvideoEventListener);
        if (_panMusic == null) {
          panvideoManager.setVolumne(0);
        }
    }
    super.onTransition(transition);
  }

  Future<void> _panvideoEventListener(BetterPlayerEvent event) async {
    if (_panMusic == null) return;

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.finished:
        await _panMusicPlayer.pause();
        await _panMusicPlayer.seekTo(Duration.zero);
        break;
      case BetterPlayerEventType.play:
        await _panMusicPlayer.play(_panMusic!);
        break;
      case BetterPlayerEventType.pause:
        await _panMusicPlayer.pause();
        break;
      case BetterPlayerEventType.seekTo:
        await _panMusicPlayer.seekTo(panvideoManager.videoPosition);
        break;
      default:
    }
  }

  @disposeMethod
  @override
  Future<void> close() async {
    super.close();
    disposeAllSubscriptions();
    _panMusicPlayer.dispose();
  }
}
