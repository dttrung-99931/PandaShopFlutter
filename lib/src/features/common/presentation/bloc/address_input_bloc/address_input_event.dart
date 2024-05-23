// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_input_bloc.dart';

class OnSaveMyAddress extends BaseEventWithoutProps {}

class OnGetHouseNumberFromMapPlace extends BaseEvent {
  final MapPlace place;
  OnGetHouseNumberFromMapPlace({
    required this.place,
  });
  
  @override
  List<Object?> get props => [place];
}
