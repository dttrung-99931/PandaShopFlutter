import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Like CustomBlocBuilder but builder has additional context param
class CustomBlocBuilder2<T extends BaseBloc> extends StatefulWidget {
  final List<Type>? buildForStates;
  final bool Function(BaseState state)? buildCondition;
  final BaseEvent? initialEvent;
  final Widget Function(BaseState state, BuildContext context) builder;
  final bool handleLoading;
  final Type loadingStateType;
  final bool isSliver;
  final T? bloc;
  // true -> get bloc for BlocBuilder from context instead of getIt or param
  final bool useProvider;

  CustomBlocBuilder2({
    super.key,
    this.buildForStates,
    required this.builder,
    this.initialEvent,
    this.handleLoading = true,
    this.loadingStateType = LoadingState,
    this.isSliver = false,
    this.buildCondition,
    T? bloc,
    this.useProvider = false,
  })  : bloc = useProvider ? null : bloc ?? getIt(),
        assert(useProvider || bloc == null, 'bloc must be null when useProvider = true');

  @override
  State<CustomBlocBuilder2<T>> createState() => _CustomBlocBuilder2State<T>();
}

class _CustomBlocBuilder2State<T extends BaseBloc> extends State<CustomBlocBuilder2<T>> {
  late T? _bloc = widget.useProvider ? context.read<T>() : widget.bloc;

  @override
  void didUpdateWidget(covariant CustomBlocBuilder2<T> oldWidget) {
    _bloc = widget.bloc;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialEvent != null) {
      _bloc?.add(widget.initialEvent!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, BaseState>(
      bloc: _bloc,
      // only build when
      buildWhen: (previous, current) {
        bool isOkType = widget.buildForStates != null
            ? [widget.loadingStateType, ErrorState, ...widget.buildForStates!].contains(current.runtimeType)
            : true;
        bool isOkCondition = widget.buildCondition != null ? widget.buildCondition!(current) : true;
        return isOkType && isOkCondition;
      },
      builder: (context, state) {
        if (widget.handleLoading && state.runtimeType == widget.loadingStateType) {
          return widget.isSliver ? const SliverToBoxAdapter(child: LoadingWidget()) : const LoadingWidget();
        }
        return widget.builder(state, context);
        // throw 'State ${state.runtimeType} has been not handled UI';
      },
    );
  }
}
