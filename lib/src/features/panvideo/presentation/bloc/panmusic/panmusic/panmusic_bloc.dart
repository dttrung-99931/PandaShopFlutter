// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/get_panmusics_request.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/panmusic/get_panmusics_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'panmusic_event.dart';
part 'panmusic_state.dart';

PanMusicBloc get panMusicBloc => getIt<PanMusicBloc>();

@lazySingleton
class PanMusicBloc extends BaseBloc {
  final GetPanMusicsUseCase _getPanMusics;
  final List<PanMusicDto> _panmusics = [];
  PaginatedList<PanMusicDto>? _currentPage;

  PanMusicBloc(this._getPanMusics) : super(InitialState()) {
    onLoad<OnGetPanMusics>(_onGetPanMusics);
  }

  Future<void> _onGetPanMusics(OnGetPanMusics event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getPanMusics.call(GetPanMusicsRequest(q: event.q)),
      emit: emit.call,
      onSuccess: (PaginatedList<PanMusicDto> page) {
        // TODO: hanlde reset page
        _currentPage = page;
        _panmusics.assignAll(page.data);
        return GetPanMusicsSuccess(_panmusics);
      },
    );
  }
}
