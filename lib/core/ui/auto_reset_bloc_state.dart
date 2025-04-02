import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/material.dart';

// State that automatically resets the lazy single bloc when the widget is disposed
abstract class AutoResetBlocState<T extends StatefulWidget, Bloc extends BaseBloc> extends State<T> {
  @override
  void dispose() {
    resetBloc();
    super.dispose();
  }

  @mustCallSuper
  void resetBloc() {
    getIt.resetLazySingleton<Bloc>();
  }
}
