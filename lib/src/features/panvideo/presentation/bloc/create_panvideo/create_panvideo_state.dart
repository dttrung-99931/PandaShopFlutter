// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_panvideo_bloc.dart';

class CreatePanvideoSuccess extends FullDataLoadedState<CreatePanvideoResponseDto> {
  CreatePanvideoSuccess(super.data);
}

class EditPanvideoSuccess extends BaseState {
  final EditPanvideoResultDto panvideo;
  EditPanvideoSuccess({
    required this.panvideo,
  });

  @override
  List<Object?> get props => [panvideo];
}
