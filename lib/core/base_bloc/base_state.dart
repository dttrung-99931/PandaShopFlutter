import 'package:evievm_app/core/failures/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/time_utils.dart';

abstract class BaseState extends Equatable {}

class BaseStateWithoutProps extends BaseState {
  @override
  List<Object?> get props => [];
}

class InitialState extends BaseStateWithoutProps {}

class LoadingState<T> extends BaseStateWithoutProps {}

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

abstract class ListLoadedState<T, TId> extends FullDataLoadedState<List<T>> {
  final TId? selectedId;
  T? get selected => data.firstWhereOrNull((element) => getId(element) == selectedId);

  TId getId(T element);
  bool get isValid => selectedId != null && selectedId != Constatnts.idEmpty;

  ListLoadedState(super.data, {required this.selectedId});

  @override
  List<Object?> get props => [super.props, selectedId];
}

class PartDataLoadedState<T> extends BaseState {
  final T data;
  final bool isLast;

  PartDataLoadedState(this.data, {this.isLast = true});

  @override
  List<Object?> get props => [data, isLast];
}

class ValidateDataState extends BaseState {
  final bool isValid;
  final String? message;
  final bool showErrorMsg;
  bool get shouldShowError => !isValid && showErrorMsg;

  ValidateDataState(this.isValid, {this.showErrorMsg = false, this.message = 'Vui lòng nhập đầy đủ thông tin!'});

  @override
  List<Object?> get props => [isValid, now.toString(), showErrorMsg, message];
}
