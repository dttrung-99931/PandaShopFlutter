import 'dart:async';

mixin DisposableMixin {
  final Set<StreamSubscription> _subs = {};

  void addSubscription(StreamSubscription sub) {
    _subs.add(sub);
  }

  void disposeAllSubscriptions() {
    for (var sub in _subs) {
      sub.cancel();
    }
    _subs.clear();
  }
}
