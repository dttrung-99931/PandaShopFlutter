import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:injectable/injectable.dart';

part 'image_input_event.dart';
part 'image_input_state.dart';

ImageInputBloc get imageInputBloc => getIt();

@lazySingleton
class ImageInputBloc extends BaseBloc {
  ImageInputBloc() : super(InitialState()) {
    on<OnInitImagesInput>(_onInitImagesInput);
    on<OnAddNewImage>(_onAddNewImage);
  }
  List<BaseImageDto> _images = [];

  FutureOr<void> _onInitImagesInput(OnInitImagesInput event, Emitter<BaseState> emit) {
    _images = event.images;
    emit(ImagesInputUpdated(_images));
  }

  FutureOr<void> _onAddNewImage(OnAddNewImage event, Emitter<BaseState> emit) async {}
}
