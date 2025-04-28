// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_panvideo_bloc.dart';

class OnCreatePanvideo extends BaseEvent {
  OnCreatePanvideo(this.panvideo);
  final EditPanvideoResultDto panvideo;

  @override
  List<Object?> get props => [panvideo];
}

class OnEditPanvideo extends BaseEvent {
  final EditPanvideoArgs args;

  OnEditPanvideo(this.args);

  @override
  List<Object?> get props => [args];
}
