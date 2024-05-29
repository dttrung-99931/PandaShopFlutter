import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/base_bloc/bloc_validation_mixin.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef EventHandlerType<T> = FutureOr<void> Function(
  T event,
  Emitter<BaseState> emit,
);

typedef TransformerType<T> = Stream<T> Function(Stream<T>, Stream<T> Function(T))?;

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> with BlocValidationMixin {
  BaseBloc(super.initialState) {
    blocCommunication?.startCommunication(this);
    on<BaseEvent>(onEveryEvent);
    on<OnSetState>(_onSetState);
    setupOnValidations();
  }

  @override
  @mustCallSuper
  Future<void> close() {
    blocCommunication?.stopCommunication();
    return super.close();
  }

  // Commnunication with other bloc if needed
  BlocCommunication? get blocCommunication => null;

  /// Same to [on] method, but pre-handle loading event by set [LoadingState]
  void onLoad<T extends BaseEvent>(EventHandlerType<T> handler,
      {TransformerType<T> transformer, LoadingState Function(T event)? loadingBuilder}) {
    on<T>(
      (event, emit) async {
        emit(loadingBuilder != null ? loadingBuilder(event) : LoadingState());
        await handler(event, emit);
      },
      transformer: transformer,
    );
  }

  FutureOr<void> onEveryEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is InitialEvent) {
      onInitialEvent();
      emit(InitialState());
      return;
    }
  }

  /// Handle result from usecase
  /// Emit success state built from [onSuccess] if either is right (success)
  /// Otherwise emit [ErrorState] by default. Use [onError] to build custom error state
  ///
  /// NOTE: must await this when call inside [on], [onLoad]. If not, a bloc emit error will be thrown
  Future<T?> handleUsecaseResult<T>({
    required Future<Either<Failure, T>> usecaseResult,
    required void Function(BaseState) emit,
    BaseState? Function(T result)? onSuccess,
    ErrorState Function(Failure failure)? onError,
    bool showErrorWhenFail = true,
  }) async {
    Either<Failure, T> either = await usecaseResult;
    T? result;
    BaseState? state = either.fold(
      (Failure l) {
        ErrorState errorState = onError?.call(l) ?? ErrorState(l);
        // Global context is null in case this is called from background (when received noti)
        if (showErrorWhenFail && Global.globalKey.currentContext != null) {
          showSnackBar(errorState.failure.displayMsg, SnackType.fail);
        }
        return errorState;
      },
      (T res) {
        result = res;
        return onSuccess?.call(res);
      },
    );
    if (state != null) {
      emit(state);
    }
    return result;
  }

  void onInitialEvent() {}

  FutureOr<void> _onSetState(OnSetState<BaseState> event, Emitter<BaseState> emit) {
    emit(event.state);
  }

  @override
  void add(BaseEvent event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}
