// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

class GetOrderConfirmSuccess extends FullDataLoadedState<CreateOrderDto> {
  GetOrderConfirmSuccess(super.data);
}

class CreatOrderSuccess extends LoadingCompleteStateWithoutProps {}

class CreateOrderError extends ErrorState {
  CreateOrderError(super.failure);
}
