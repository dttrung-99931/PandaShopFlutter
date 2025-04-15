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
import 'package:evievm_app/src/features/panvideo/domain/use_cases/my_panvideos/get_my_panvideos_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'my_panvideo_event.dart';
part 'my_panvideo_state.dart';

MyPanVideoBloc get myPanVideoBloc => getIt<MyPanVideoBloc>();

@lazySingleton
class MyPanVideoBloc extends BaseBloc {
  final GetMyPanvideosUseCase _genMyPanvideos;
  final List<PanvideoDto> _panvideos = [];
  PaginatedList<PanvideoDto>? _currentPage;

  MyPanVideoBloc(this._genMyPanvideos) : super(InitialState()) {
    onLoad<OnGetMyPanvideos>(_onGetMyPanvideos);
  }

  Future<void> _onGetMyPanvideos(OnGetMyPanvideos event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _genMyPanvideos.call(GetPanvideosRequest(q: event.q)),
      emit: emit.call,
      onSuccess: (PaginatedList<PanvideoDto> page) {
        // TODO: hanlde reset page
        _currentPage = page;
        _panvideos.assignAll(page.data);
        return GetMyPanvideosSuccess(_panvideos);
      },
    );
  }
}
