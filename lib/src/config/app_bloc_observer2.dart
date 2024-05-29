import 'dart:developer';

import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Show bloc state & event clearly
class AppBlocObserver2 extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    // Seperator log
    log('----------------------------------------');
    log('EVENT  ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('STATE  ${change.nextState.runtimeType}');
    if (change.nextState is ErrorState) {
      log('Error msg: ${change.nextState.failure.msg}');
    }
    super.onChange(bloc, change);
  }
}
