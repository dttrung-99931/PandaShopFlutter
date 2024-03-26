part of 'image_input_bloc.dart';

class ImagesInputUpdated extends FullDataLoadedState<List<ImageInputDto>> {
  final EditAction action;
  final ImageInputDto image;
  ImagesInputUpdated(
    super.data, {
    required this.action,
    required this.image,
  });
}

class ImageAdded extends FullDataLoadedState<ImageInputDto> {
  ImageAdded(super.data);
}
