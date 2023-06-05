import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Show bloc state & event clearly
class AppBlocObserver extends BlocObserver {
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
    // log('STATE  ${change.nextState.runtimeType} props ${(change.nextState as BaseState).props}');
    super.onChange(bloc, change);
  }
}
