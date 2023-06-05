import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocConcurrency {
  BlocConcurrency._();

  static EventTransformer<Event> restartable<Event>() => (events, mapper) {
        return events.switchMap(mapper);
      };

  static EventTransformer<Event> sequential<Event>() => (events, mapper) {
        return events.asyncExpand(mapper);
      };

  static EventTransformer<Event> debounce<Event>(Duration duration) => (events, mapper) {
        return events.debounceTime(duration).asyncExpand(mapper);
      };

  static EventTransformer<Event> droppable<Event>() => (events, mapper) {
        return events.transform(_ExhaustMapStreamTransformer(mapper));
      };
}

class _ExhaustMapStreamTransformer<T> extends StreamTransformerBase<T, T> {
  _ExhaustMapStreamTransformer(this.mapper);

  final EventMapper<T> mapper;

  @override
  Stream<T> bind(Stream<T> stream) {
    late StreamSubscription<T> subscription;
    StreamSubscription<T>? mappedSubscription;

    final controller = StreamController<T>(
      onCancel: () async {
        await mappedSubscription?.cancel();
        return subscription.cancel();
      },
      sync: true,
    );

    subscription = stream.listen(
      (data) {
        if (mappedSubscription != null) return;
        final Stream<T> mappedStream;

        mappedStream = mapper(data);
        mappedSubscription = mappedStream.listen(
          controller.add,
          onError: controller.addError,
          onDone: () => mappedSubscription = null,
        );
      },
      onError: controller.addError,
      onDone: () => mappedSubscription ?? controller.close(),
    );

    return controller.stream;
  }
}
