// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_panvideo_bloc.dart';

class OnGetMyPanvideos extends BaseEvent {
  final String? q;

  OnGetMyPanvideos({this.q});

  @override
  List<Object?> get props => [q];
}
