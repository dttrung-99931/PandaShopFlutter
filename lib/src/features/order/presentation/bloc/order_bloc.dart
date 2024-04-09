// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/domain/dto/order_confirm_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base_bloc/base_event.dart';

part 'order_event.dart';
part 'order_state.dart';

OrderBloc get orderBloc => getIt<OrderBloc>();

@lazySingleton
class OrderBloc extends BaseBloc {
  OrderBloc() : super(InitialState()) {
    onLoad<OnGetOrderComfirm>(_onGetOrderConfirm);
  }

  FutureOr<void> _onGetOrderConfirm(OnGetOrderComfirm event, Emitter<BaseState> emit) async {
    emit(GetOrderConfirmSuccess(OrderConfirmDto(items: event.items)));
  }
}
