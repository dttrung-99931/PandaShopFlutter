// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panmusic/player/panmusic_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

part 'panmusic_player_event.dart';
part 'panmusic_player_state.dart';

PanMusicPlayerBloc get panMusicPlayerBloc => getIt<PanMusicPlayerBloc>();

@lazySingleton
class PanMusicPlayerBloc extends BaseBloc with DisposableMixin {
  final PanMusicPlayer _panMusicPlayer;

  PanMusicPlayerBloc(this._panMusicPlayer) : super(InitialState()) {
    on<OnPlayPanMusic>(_onPlayPanMusic);
    on<OnPausePanMusic>(_onPausePanMusic);
  }

  PanMusicDto? get playingMusic => _panMusicPlayer.playingMusic;

  Future<void> _onPausePanMusic(OnPausePanMusic event, Emitter<BaseState> emit) async {
    await _panMusicPlayer.pause();
    emit(PanMusicPaused(event.music));
  }

  Future<void> _onPlayPanMusic(OnPlayPanMusic event, Emitter<BaseState> emit) async {
    emit(PanMusicLoading(event.music));

    try {
      await _panMusicPlayer.play(event.music, resetPlayingMusic: event.resetPlayingMusic);
      emit(PanMusicPlaying(event.music));
    } catch (e) {
      emit(PanMusicError(event.music, Failure(e.toString())));
    }
  }

  @disposeMethod
  @override
  Future<void> close() {
    _panMusicPlayer.dispose();
    return super.close();
  }
}
