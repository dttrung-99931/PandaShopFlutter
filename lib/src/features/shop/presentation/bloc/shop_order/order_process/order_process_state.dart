part of 'order_process_bloc.dart';

class ProcessingOrderState extends BaseState {
  ProcessingOrderState({required this.order});
  final OrderDto order;
  @override
  List<Object?> get props => [order];
}

class StartProcessingOrderSuccess extends ProcessingOrderState {
  StartProcessingOrderSuccess({required super.order});
}

class CompleteProcessingOrderSuccess extends ProcessingOrderState {
  CompleteProcessingOrderSuccess({required super.order});
}

class RequestPartnerDeliverySuccess extends LoadingCompleteStateWithoutProps {}
