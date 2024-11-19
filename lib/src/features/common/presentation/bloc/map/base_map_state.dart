// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'base_map_bloc.dart';

class MapSDKInitilized extends LoadingCompleteState {
  @override
  List<Object?> get props => [now.toString()];
}

class MapSDKDisposed extends LoadingCompleteState {
  @override
  List<Object?> get props => [now.toString()];
}
