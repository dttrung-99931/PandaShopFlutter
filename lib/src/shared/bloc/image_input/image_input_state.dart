part of 'image_input_bloc.dart';

class ImagesInputUpdated extends FullDataLoadedState<List<BaseImageDto>> {
  ImagesInputUpdated(super.data);
}

class ImageAdded extends FullDataLoadedState<ImageInputDto> {
  ImageAdded(super.data);
}
