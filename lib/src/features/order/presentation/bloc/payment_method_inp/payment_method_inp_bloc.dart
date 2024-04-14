// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/domain/dto/sub_order_dto.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_payment_methods_usecase.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'payment_method_inp_event.dart';
part 'payment_method_inp_state.dart';

PaymentMethodInpBloc get paymentMethodInpBloc => getIt<PaymentMethodInpBloc>();

@lazySingleton
class PaymentMethodInpBloc extends BaseBloc {
  PaymentMethodInpBloc(
    this._getPaymentMethods,
  ) : super(InitialState()) {
    on<OnGetPayementMethods>(_onOnGetPaymentMethods);
    on<OnPaymentMethodSelected>(_onDeliveryMethodSelected);
  }
  final GetPaymentMethodsUseCase _getPaymentMethods;
  List<PaymentMethodDto>? _paymentMethods;

  FutureOr<void> _onOnGetPaymentMethods(OnGetPayementMethods event, Emitter<BaseState> emit) async {
    if (_paymentMethods != null) {
      emit(GetPaymentMethodsSuccess(
        _paymentMethods!,
        selectedId: event.selectedId,
      ));
      return;
    }
    await handleUsecaseResult(
        usecaseResult: _getPaymentMethods.call(noParam),
        emit: emit,
        onSuccess: (List<PaymentMethodDto> result) {
          return GetPaymentMethodsSuccess(
            _paymentMethods = result,
            selectedId: event.selectedId ?? result.firstOrNull?.id,
          );
        });
  }

  FutureOr<void> _onDeliveryMethodSelected(OnPaymentMethodSelected event, Emitter<BaseState> emit) {}
}
