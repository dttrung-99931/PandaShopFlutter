import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocConsumer<T extends BaseBloc> extends StatefulWidget {
  final List<Type> buildForStates;
  final List<Type> listenForStates;
  final BaseEvent? initialEvent;
  final Widget Function(BaseState state) builder;
  final void Function(BaseState state) listener;
  final bool handleLoading;
  final Type loadingStateType;
  final bool isSliver;

  CustomBlocConsumer({
    super.key,
    this.buildForStates = const [],
    required this.listenForStates,
    required this.builder,
    required this.listener,
    this.loadingStateType = LoadingState,
    this.handleLoading = true,
    this.initialEvent,
    this.isSliver = false,
  });

  @override
  State<CustomBlocConsumer<T>> createState() => _CustomBlocConsumerState<T>();
}

class _CustomBlocConsumerState<T extends BaseBloc> extends State<CustomBlocConsumer<T>> {
  final T _bloc = getIt();

  @override
  void initState() {
    super.initState();
    if (widget.initialEvent != null) {
      _bloc.add(widget.initialEvent!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, BaseState>(
      listener: (context, state) {
        widget.listener(state);
      },
      bloc: _bloc,
      // only build when
      buildWhen: (previous, current) {
        return [LoadingState, ErrorState, ...widget.buildForStates].contains(current.runtimeType);
      },
      listenWhen: (previous, current) {
        return widget.listenForStates.contains(current.runtimeType);
      },
      builder: (context, state) {
        if (widget.handleLoading && state.runtimeType == widget.loadingStateType) {
          return widget.isSliver ? const SliverFillRemaining(child: LoadingWidget()) : const LoadingWidget();
        }
        return widget.builder(state);
        // throw 'State ${state.runtimeType} has been not handled UI';
      },
    );
  }
}
