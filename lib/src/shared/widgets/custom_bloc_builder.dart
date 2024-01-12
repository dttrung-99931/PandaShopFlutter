import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocBuilder<T extends BaseBloc> extends StatefulWidget {
  final List<Type> buildForStates;
  final BaseEvent? initialEvent;
  final Widget Function(BaseState state) builder;
  final bool handleLoading;
  final Type loadingStateType;
  final bool isSliver;

  const CustomBlocBuilder({
    super.key,
    required this.buildForStates,
    required this.builder,
    this.initialEvent,
    this.handleLoading = true,
    this.loadingStateType = LoadingState,
    this.isSliver = false,
  });

  @override
  State<CustomBlocBuilder<T>> createState() => _CustomBlocBuilderState<T>();
}

class _CustomBlocBuilderState<T extends BaseBloc> extends State<CustomBlocBuilder<T>> {
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
    return BlocBuilder<T, BaseState>(
      bloc: _bloc,
      // only build when
      buildWhen: (previous, current) {
        return [widget.loadingStateType, ErrorState, ...widget.buildForStates].contains(current.runtimeType);
      },
      builder: (context, state) {
        if (widget.handleLoading && state.runtimeType == widget.loadingStateType) {
          return widget.isSliver ? const SliverToBoxAdapter(child: LoadingWidget()) : const LoadingWidget();
        }
        return widget.builder(state);
        // throw 'State ${state.runtimeType} has been not handled UI';
      },
    );
  }
}
