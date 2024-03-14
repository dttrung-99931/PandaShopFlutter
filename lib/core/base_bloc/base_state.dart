import 'package:evievm_app/core/failures/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/time_utils.dart';

abstract class BaseState extends Equatable {}

class BaseStateWithoutProps extends BaseState {
  @override
  List<Object?> get props => [];
}

class InitialState extends BaseStateWithoutProps {}

class LoadingState extends BaseStateWithoutProps {}

abstract class LoadingCompleteState extends BaseState {}

class LoadingCompleteStateWithoutProps extends LoadingCompleteState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends LoadingCompleteState {
  final Failure failure;
  ErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}

class FullDataLoadedState<T> extends LoadingCompleteState {
  final T data;

  FullDataLoadedState(this.data);

  /// TODO: fix CustomBlocBuilder not receive state. Remove now.toString
  @override
  List<Object?> get props => [data, now.toString()];
}

class PartDataLoadedState<T> extends BaseState {
  final T data;
  final bool isLast;

  PartDataLoadedState(this.data, {this.isLast = true});

  @override
  List<Object?> get props => [data, isLast];
}
