import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocListener<T extends BaseBloc> extends StatefulWidget {
  final BaseEvent? initialEvent;
  final void Function(BaseState state) listener;
  final List<Type>? listenForStates;
  final Widget? child;
  final bool handleGlobalLoading;
  const CustomBlocListener({
    super.key,
    this.initialEvent,
    required this.listener,
    this.listenForStates,
    this.child,
    this.handleGlobalLoading = false,
  });

  @override
  State<CustomBlocListener<T>> createState() => _CustomBlocListenerState<T>();
}

class _CustomBlocListenerState<T extends BaseBloc> extends State<CustomBlocListener<T>> {
  T _bloc = getIt();

  @override
  void initState() {
    super.initState();
    if (widget.initialEvent != null) {
      _bloc.add(widget.initialEvent!);
    }
  }

  @override
  void didUpdateWidget(covariant CustomBlocListener<T> oldWidget) {
    _bloc = getIt();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, BaseState>(
      bloc: _bloc,
      listenWhen: widget.listenForStates == null
          ? null
          : (previous, current) {
              return widget.listenForStates!.contains(current.runtimeType);
            },
      listener: (context, state) {
        _handleShowHideGlobalLoading(state);
        widget.listener(state);
      },
      child: widget.child,
    );
  }

  void _handleShowHideGlobalLoading(BaseState state) {
    if (!widget.handleGlobalLoading) return;
    if (state is LoadingState) {
      showLoadingOverlay();
    } else if (state is LoadingCompleteState) {
      hideLoadingOverlay();
    }
  }
}
