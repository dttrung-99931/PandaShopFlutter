// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'panvideo_bloc.dart';

class OnGetPanvideos extends BaseEvent {
  final String? q;

  OnGetPanvideos({this.q});

  @override
  List<Object?> get props => [q];
}
