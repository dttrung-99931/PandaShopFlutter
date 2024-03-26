// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'base_state.dart';

abstract class BaseEvent extends Equatable {}

class OnGetSelectData<T extends Object> extends BaseEvent {
  final T? selectedId;
  OnGetSelectData({
    this.selectedId,
  });

  @override
  List<Object?> get props => [selectedId];
}

class BaseEventWithoutProps extends BaseEvent {
  @override
  List<Object?> get props => [DateTime.now()];
}

class ErrorEvent extends BaseEvent {
  final String message;

  ErrorEvent(this.message);

  @override
  List<Object?> get props => [message];
}

/// Base Event. BaseBloc auto set [LoadingState] if [LoadingEvent] is trigger
/// It can be used for showing global loading
abstract class LoadingEvent extends BaseEvent {}

class LoadingEventWithoutProps extends LoadingEvent {
  @override
  List<Object?> get props => [];
}

// Make bloc state become initial
class InitialEvent extends BaseEventWithoutProps {}

class OnCheckChanged extends BaseEvent {
  final bool isChecked;
  OnCheckChanged(this.isChecked);

  @override
  List<Object?> get props => [isChecked];
}

class OnSetState<T extends BaseState> extends BaseEvent {
  final T state;

  OnSetState(this.state);

  @override
  List<Object?> get props => [state];
}
