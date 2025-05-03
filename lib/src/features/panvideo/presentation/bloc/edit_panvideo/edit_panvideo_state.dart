part of 'edit_panvideo_bloc.dart';

class EditPanvideoSuccess extends BaseState {
  final File editedVideo;
  EditPanvideoSuccess(this.editedVideo);

  @override
  List<Object?> get props => [editedVideo];
}

class LoadingEditPanvideo extends LoadingState {}
