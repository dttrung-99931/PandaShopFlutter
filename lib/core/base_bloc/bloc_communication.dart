import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:injectable/injectable.dart';

// Communicate with other blocs
abstract class BlocCommunication<TBloc extends BaseBloc> {
  final List<StreamSubscription> _subscriptions = [];

  void startCommunication(TBloc bloc);

  void listenOtherBloc<TOtherBloc extends BaseBloc>(Function(BaseState state) onStateChanged) {
    _subscriptions.add(getIt<TOtherBloc>().stream.listen((BaseState state) {
      onStateChanged(state);
    }));
  }

  @disposeMethod
  void stopCommunication() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
  }
}
