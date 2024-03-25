// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_input_bloc.dart';

class OnInitImagesInput extends BaseEvent {
  final List<BaseImageDto> images;
  OnInitImagesInput({
    required this.images,
  });

  @override
  List<Object?> get props => [images];
}

class OnAddNewImage extends BaseEventWithoutProps {}
