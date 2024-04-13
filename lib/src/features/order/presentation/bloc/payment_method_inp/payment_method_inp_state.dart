// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_method_inp_bloc.dart';

class GetPaymentMethodsSuccess extends ListLoadedState<PaymentMethodDto, int> {
  GetPaymentMethodsSuccess(
    super.data, {
    required super.selectedId,
  });

  @override
  int getId(PaymentMethodDto element) {
    return element.id;
  }
}
