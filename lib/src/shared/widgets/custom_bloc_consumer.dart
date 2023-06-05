import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocConsumer<T extends BaseBloc> extends StatelessWidget {
  final T _bloc = getIt();
  final List<Type> buildAndListenForStates;
  final BaseEvent? initialEvent;
  final Widget Function(BaseState state) builder;
  final void Function(BaseState state) listener;
  final bool handleLoading;

  CustomBlocConsumer({
    super.key,
    required this.buildAndListenForStates,
    required this.builder,
    required this.listener,
    this.handleLoading = true,
    this.initialEvent,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, BaseState>(
      listener: (context, state) {
        listener(state);
      },
      bloc: (() {
        // A trick for add event and return _bloc
        if (initialEvent != null) {
          _bloc.add(initialEvent!);
        }
        return _bloc;
      })(),
      // only build when
      buildWhen: (previous, current) {
        return buildAndListenForStates.contains(current.runtimeType);
      },
      builder: (context, state) {
        if (handleLoading && state is LoadingState) {
          return const LoadingWidget();
        }
        return builder(state);
        // throw 'State ${state.runtimeType} has been not handled UI';
      },
    );
  }
}
