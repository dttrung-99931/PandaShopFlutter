// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelect extends StatefulWidget {
  const PaymentMethodSelect({
    super.key,
  });

  @override
  State<PaymentMethodSelect> createState() => _PaymentMethodSelectState();
}

class _PaymentMethodSelectState extends State<PaymentMethodSelect> {
  @override
  void initState() {
    paymentMethodInpBloc.add(OnGetPayementMethods(selectedId: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownInput<PaymentMethodDto, int, GetPaymentMethodsSuccess, PaymentMethodInpBloc>(
      titleFontWeight: FontWeight.bold,
      direction: Axis.vertical,
      title: 'Phương thức thanh toán',
      onSelected: (PaymentMethodDto selected) {
        paymentMethodInpBloc.add(OnPaymentMethodSelected(
          selected: selected,
        ));
      },
      buildCondition: (state) {
        return state is GetPaymentMethodsSuccess;
      },
      nameGetter: (PaymentMethodDto selected) {
        return selected.name;
      },
    );
  }
}
