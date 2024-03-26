import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:evievm_app/src/shared/enums/edit_action.dart';
import 'package:injectable/injectable.dart';

part 'image_input_event.dart';
part 'image_input_state.dart';

ImageInputBloc get imageInputBloc => getIt();

@lazySingleton
class ImageInputBloc extends BaseBloc {
  ImageInputBloc(this._pickImageAsBase64Usecase) : super(InitialState()) {
    on<OnInitImagesInput>(_onInitImagesInput);
    on<OnAddNewImage>(_onAddNewImage);
    on<OnChangeImage>(_onChangeImage);
    on<OnDeleteImage>(_onDeleteImage);
  }
  final PickLocalImageAsBase64UseCase _pickImageAsBase64Usecase;
  List<ImageInputDto> _images = [];

  FutureOr<void> _onInitImagesInput(OnInitImagesInput event, Emitter<BaseState> emit) {
    _images = event.images;
    emit(ImagesInputUpdated(
      _images,
      action: EditAction.none,
      image: ImageInputDto.empty,
    ));
  }

  FutureOr<void> _onAddNewImage(OnAddNewImage event, Emitter<BaseState> emit) async {
    String? base64 = await _pickImageAsBase64(emit);
    if (base64 != null) {
      ImageInputDto newImage = ImageInputDto.fromBase64Image(base64);
      _images.add(newImage);
      emit(ImagesInputUpdated(
        _images,
        action: EditAction.add,
        image: newImage,
      ));
    }
  }

  FutureOr<void> _onChangeImage(OnChangeImage event, Emitter<BaseState> emit) async {
    if (!_validateIndex(event.index)) {
      return;
    }
    String? base64 = await _pickImageAsBase64(emit);
    if (base64 != null) {
      _images[event.index] = _images[event.index].copyWith(based64Img: base64);
      emit(ImagesInputUpdated(_images, action: EditAction.update, image: _images[event.index]));
    }
  }

  FutureOr<void> _onDeleteImage(OnDeleteImage event, Emitter<BaseState> emit) async {
    if (!_validateIndex(event.index)) {
      return;
    }
    ImageInputDto delImage = _images[event.index];
    _images.removeAt(event.index);
    emit(ImagesInputUpdated(_images, action: EditAction.delete, image: delImage));
  }

  Future<String?> _pickImageAsBase64(Emitter<BaseState> emit) async {
    return await handleUsecaseResult<String?>(
      usecaseResult: _pickImageAsBase64Usecase.call(noParam),
      emit: emit,
    );
  }

  bool _validateIndex(int index) => index >= 0 && index < _images.length;
}
