import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_use_case.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:injectable/injectable.dart';

part 'image_input_event.dart';
part 'image_input_state.dart';

ImageInputBloc get imageInputBloc => getIt();

@lazySingleton
class ImageInputBloc extends BaseBloc {
  ImageInputBloc(this._pickImage) : super(InitialState()) {
    on<OnInitImagesInput>(_onInitImagesInput);
    on<OnAddNewImage>(_onAddNewImage);
  }
  final PickLocalImageUseCase _pickImage;
  List<BaseImageDto> _images = [];

  FutureOr<void> _onInitImagesInput(OnInitImagesInput event, Emitter<BaseState> emit) {
    _images = event.images;
    emit(ImagesInputUpdated(_images));
  }

  FutureOr<void> _onAddNewImage(OnAddNewImage event, Emitter<BaseState> emit) async {
    File? image = await handleUsecaseResult<File?>(
      usecaseResult: _pickImage.call(noParam),
      emit: emit,
    );

    if (image != null) {
      List<int> bytes = await image.readAsBytes();
      if (bytes.isEmpty) {
        // User cancel
        return;
      }
      String format = image.uri.path.split('.').lastWhereOrNull((p0) => true) ?? 'png';
      String header = 'data:image/$format;base64';
      String base64 = '$header,${base64Encode(bytes)}';
      ImageInputDto imageDto = ImageInputDto(
        id: null,
        based64Img: base64,
        orderIndex: _images.length,
        description: '',
      );
      _images.add(imageDto);
      emit(ImagesInputUpdated(_images));
    } else {
      // User cancel
      // TODO
    }
  }
}
