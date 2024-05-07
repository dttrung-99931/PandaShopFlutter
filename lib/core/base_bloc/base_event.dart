// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/time_utils.dart';

import 'base_state.dart';

abstract class BaseEvent extends Equatable {}

class OnGetSelectData extends BaseEvent {
  final int selectedId;
  OnGetSelectData({
    this.selectedId = Constants.idEmpty,
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

class OnSelect<T> extends BaseEvent {
  final T? selected;
  OnSelect({
    required this.selected,
  });

  @override
  List<Object?> get props => [selected];
}

class OnGetListSelect extends BaseEvent {
  final int? selectedId;
  OnGetListSelect({
    required this.selectedId,
  });

  @override
  List<Object?> get props => [selectedId];
}

class OnSetFormValidateCallBack extends BaseEvent {
  final bool Function() formValidateCallBack;
  OnSetFormValidateCallBack(this.formValidateCallBack);

  @override
  List<Object?> get props => [formValidateCallBack];
}

class OnUnsetFormValidateCallBack extends BaseEventWithoutProps {}

// enum ValidateType {
//   validateEdit,
//   validateCreate,
// }

class OnValidateData extends BaseEvent {
  // final ValidateType type;
  final bool showErrorMsg;
  final bool isValidateToSubmit;
  OnValidateData({
    // this.type = ValidateType.validateCreate,
    this.showErrorMsg = false,
    this.isValidateToSubmit = false,
  });

  OnValidateData.validateToSubmit()
      : isValidateToSubmit = true,
        showErrorMsg = true;

  @override
  List<Object?> get props => [now.toString(), showErrorMsg];
}
