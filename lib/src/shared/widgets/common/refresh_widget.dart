// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RefreshParentWidget extends StatefulWidget {
  const RefreshParentWidget({super.key, required this.child});
  final Widget child;

  @override
  State<RefreshParentWidget> createState() => _RefreshParentWidgetState();
}

class _RefreshParentWidgetState extends State<RefreshParentWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshParent(
      child: widget.child,
      refresh: () => setState(
        () {},
      ),
    );
  }
}

class RefreshParent extends InheritedWidget {
  final Function() _refresh;

  const RefreshParent({
    super.key,
    required super.child,
    required dynamic Function() refresh,
  }) : _refresh = refresh;

  void refresh() {
    _refresh();
  }

  static RefreshParent of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RefreshParent>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class RefreshChildBuilder extends StatelessWidget {
  const RefreshChildBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    RefreshParent.of(context); // Make RefreshChildBuilder dependant on  RefreshParent
    return builder(context);
  }
}
