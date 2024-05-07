import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Communicate with other blocs
abstract class BlocCommunication<TBloc extends BaseBloc> {
  final List<StreamSubscription> _subscriptions = [];
  late TBloc _bloc;

  /// Must call first in child override code
  @mustCallSuper
  void startCommunication(TBloc bloc) {
    _bloc = bloc;
  }

  void listenOtherBloc<TOtherBloc extends BaseBloc>(
    Function(BaseState state) onStateChanged, {
    TOtherBloc? bloc,
  }) {
    TOtherBloc blocToListen = bloc ?? getIt<TOtherBloc>();
    _subscriptions.add((blocToListen).stream.listen((BaseState state) {
      onStateChanged(state);
    }));
  }

  /// Listen self bloc that contains this BlocCommunication
  /// Can used this after  [startCommunication] called
  /// Note: if use [listenOtherBloc] to listen self bloc will cause stack overflow errro
  void listenSelf(Function(BaseState state) onStateChanged) {
    _subscriptions.add(_bloc.stream.listen((BaseState state) {
      onStateChanged(state);
    }));
  }

  @mustCallSuper
  @disposeMethod
  void stopCommunication() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
  }
}
