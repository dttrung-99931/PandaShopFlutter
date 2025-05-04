// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'panmusic_bloc.dart';

class OnGetPanMusics extends BaseEvent {
  final String? q;

  OnGetPanMusics({this.q});

  @override
  List<Object?> get props => [q];
}
