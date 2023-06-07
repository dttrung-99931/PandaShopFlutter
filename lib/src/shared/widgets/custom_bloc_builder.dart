import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocBuilder<T extends BaseBloc> extends StatelessWidget {
  final T _bloc = getIt();
  final List<Type> buildForStates;
  final BaseEvent? initialEvent;
  final Widget Function(BaseState state) builder;
  final bool handleLoading;
  final Type loadingStateType;
  final bool isSliver;
  CustomBlocBuilder({
    super.key,
    required this.buildForStates,
    required this.builder,
    this.initialEvent,
    this.handleLoading = true,
    this.loadingStateType = LoadingState,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, BaseState>(
      bloc: (() {
        // A trick for add event and return _bloc
        if (initialEvent != null) {
          _bloc.add(initialEvent!);
        }
        return _bloc;
      })(),
      // only build when
      buildWhen: (previous, current) {
        return buildForStates.contains(current.runtimeType);
      },
      builder: (context, state) {
        if (handleLoading && state.runtimeType == loadingStateType) {
          return isSliver ? const SliverToBoxAdapter(child: LoadingWidget()) : const LoadingWidget();
        }
        return builder(state);
        // throw 'State ${state.runtimeType} has been not handled UI';
      },
    );
  }
}
