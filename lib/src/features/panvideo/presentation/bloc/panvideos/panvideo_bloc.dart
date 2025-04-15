// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/data/models/get_panvideos_request.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/use_cases/panvideos/get_panvideos_usecase.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'panvideo_event.dart';
part 'panvideo_state.dart';

PanVideoBloc get panvideosBloc => getIt<PanVideoBloc>();

@lazySingleton
class PanVideoBloc extends BaseBloc {
  final GetPanvideosUseCase _genPanvideos;
  final PanvideoManager panvideoManager;
  final List<PanvideoDto> _panvideos = [];
  PaginatedList<PanvideoDto>? _currentPage;

  PanVideoBloc(this._genPanvideos, this.panvideoManager) : super(InitialState()) {
    onLoad<OnGetPanvideos>(_onGetPanvideos);
  }

  Future<void> _onGetPanvideos(OnGetPanvideos event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _genPanvideos.call(GetPanvideosRequest(q: event.q)),
      emit: emit.call,
      onSuccess: (PaginatedList<PanvideoDto> page) {
        // TODO: hanlde reset page
        _currentPage = page;
        _panvideos.assignAll(page.data);
        panvideoManager.clearPanvideos();
        panvideoManager.addPanvideos(page.data);
        return GetPanvideosSuccess(_panvideos);
      },
    );
  }

  @disposeMethod
  void onClose() {
    getIt.resetLazySingleton<PanvideoManager>();
  }
}
