// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_method_inp_bloc.dart';

class OnGetPayementMethods extends OnGetListSelect {
  OnGetPayementMethods({
    required super.selectedId,
  });
}

class OnPaymentMethodSelected extends OnSelect<PaymentMethodDto> {
  OnPaymentMethodSelected({
    required super.selected,
  });
}
