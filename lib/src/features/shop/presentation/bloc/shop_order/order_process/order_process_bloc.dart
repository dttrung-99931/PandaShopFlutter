// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/data/models/request/shop_request_model.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart';

part 'order_process_event.dart';
part 'order_process_state.dart';

OrderProcessBloc get orderProcessBloc => getIt();

@lazySingleton
class OrderProcessBloc extends BaseBloc {
  final nameController = TextEditingController();
  final StartProcessingOrderUseCase _startProcessingOrder;
  final CompleteProcessingOrderUseCase _completeProcessingOrder;

  OrderProcessBloc(
    this._startProcessingOrder,
    this._completeProcessingOrder,
  ) : super(InitialState()) {
    on<OnStartProcessingOrder>(_onStartProcessingOrder);
    on<OnCompleteProcessingOrder>(_onCompleteProcessingOrder);
  }

  FutureOr<void> _onStartProcessingOrder(OnStartProcessingOrder event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _startProcessingOrder.call(event.order.id),
      emit: emit,
      onSuccess: (result) {
        return StartProcessingOrderSuccess(order: event.order);
      },
    );
  }

  FutureOr<void> _onCompleteProcessingOrder(OnCompleteProcessingOrder event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _completeProcessingOrder.call(event.order.id),
      emit: emit,
      onSuccess: (result) {
        return CompleteProcessingOrderSuccess(order: event.order);
      },
    );
  }
}
