part of 'order_process_bloc.dart';

class OnProcessOrder extends BaseEvent {
  OnProcessOrder({
    required this.order,
  });
  final OrderDto order;

  @override
  List<Object?> get props => [order];
}

class OnStartProcessingOrder extends OnProcessOrder {
  OnStartProcessingOrder({required super.order});
}

class OnCompleteProcessingOrder extends OnProcessOrder {
  OnCompleteProcessingOrder({required super.order});
}

class OnCancelOrder extends OnProcessOrder {
  OnCancelOrder({required super.order});
}
