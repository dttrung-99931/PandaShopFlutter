// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:evievm_app/src/features/order/data/models/request/request_partner_delivery_request_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/request_partner_delivery_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';

part 'order_process_event.dart';
part 'order_process_state.dart';

OrderProcessBloc get orderProcessBloc => getIt();

@lazySingleton
class OrderProcessBloc extends BaseBloc {
  OrderProcessBloc(
    this._startProcessingOrder,
    this._completeProcessingOrder,
    this._requestPartnerDelivery,
  ) : super(InitialState()) {
    on<OnStartProcessingOrder>(_onStartProcessingOrder);
    on<OnCompleteProcessingOrder>(_onCompleteProcessingOrder);
    onLoad<OnRequestPartnerDelivery>(_onRequestPartnerDelivery);
  }
  final nameController = TextEditingController();
  final StartProcessingOrderUseCase _startProcessingOrder;
  final CompleteProcessingOrderUseCase _completeProcessingOrder;
  final RequestPartnerDeliveryUsecase _requestPartnerDelivery;

  FutureOr<void> _onStartProcessingOrder(OnStartProcessingOrder event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _startProcessingOrder.call(event.order.id),
      emit: emit.call,
      onSuccess: (result) {
        return StartProcessingOrderSuccess(order: event.order);
      },
    );
  }

  FutureOr<void> _onCompleteProcessingOrder(OnCompleteProcessingOrder event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _completeProcessingOrder.call(event.order.id),
      emit: emit.call,
      onSuccess: (result) {
        return CompleteProcessingOrderSuccess(order: event.order);
      },
    );
  }

  FutureOr<void> _onRequestPartnerDelivery(OnRequestPartnerDelivery event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _requestPartnerDelivery.call(event.requestModel),
      emit: emit.call,
      onSuccess: (_) {
        return RequestPartnerDeliverySuccess();
      },
    );
  }
}
