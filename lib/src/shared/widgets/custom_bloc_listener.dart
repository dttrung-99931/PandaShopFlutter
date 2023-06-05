import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocListener<T extends BaseBloc> extends StatelessWidget {
  final T _bloc = getIt();
  final BaseEvent? initialEvent;
  final void Function(BaseState state) listener;
  final List<Type>? listenForStates;
  final Widget? child;
  final bool handleGlobalLoading;
  CustomBlocListener({
    super.key,
    this.initialEvent,
    required this.listener,
    this.listenForStates,
    this.child,
    this.handleGlobalLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, BaseState>(
      bloc: (() {
        // A trick for add event and return _bloc
        if (initialEvent != null) {
          _bloc.add(initialEvent!);
        }
        return _bloc;
      })(),
      listenWhen: listenForStates == null
          ? null
          : (previous, current) {
              return listenForStates!.contains(current.runtimeType);
            },
      listener: (context, state) {
        _handleShowHideGlobalLoading(state);
        listener(state);
      },
      child: child,
    );
  }

  void _handleShowHideGlobalLoading(BaseState state) {
    if (!handleGlobalLoading) return;
    if (state is LoadingState) {
      OverlayUtils.showLoadingOverlay();
    } else if (state is LoadingCompleteState) {
      OverlayUtils.hideLoadingOverlay();
    }
  }
}
