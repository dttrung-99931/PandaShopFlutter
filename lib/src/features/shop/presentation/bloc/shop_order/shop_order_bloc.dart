// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart';
import 'package:evievm_app/src/features/shopping_cart/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'shop_order_event.dart';
part 'shop_order_state.dart';

ShopOrderBloc get shopOrderBloc => getIt<ShopOrderBloc>();

@lazySingleton
class ShopOrderBloc extends BaseBloc {
  final GetOrdersUseCase _getOrders;
  final List<OrderStatus> _displayingOrderStatuses = [
    OrderStatus.pending,
    OrderStatus.created,
    OrderStatus.processing,
    OrderStatus.waitingForDelivering,
    OrderStatus.completedByUser,
    OrderStatus.completedBySystem,
  ];

  OrderStatus _selectedStatus = OrderStatus.created;
  OrderStatus get selectedStatus => _selectedStatus;

  ShopOrderBloc(
    this._getOrders,
  ) : super(InitialState()) {
    onLoad<OnGetShopOrders>(_onGetShopOrders);
    on<OnSelectOrderStatus>(_onSelectedOrderStatus);
    on<OnStartProcessingOrder>(_onStartProcessingOrder);
  }

  FutureOr<void> _onGetShopOrders(OnGetShopOrders event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _getOrders.call(GetOrdersRequestModel(
        shopId: Global.shop?.id,
        status: event.orderStatus,
      )),
      emit: emit,
      onSuccess: (List<OrderDto> result) {
        return GetShopOrdersSuccess(result);
      },
    );
  }

  FutureOr<void> _onSelectedOrderStatus(OnSelectOrderStatus event, Emitter<BaseState> emit) {
    _selectedStatus = event.selected!;
    add(OnGetShopOrders(orderStatus: event.selected!));
    emit(DisplayOrderStatusesUpdated(_displayingOrderStatuses, selectedId: event.selected));
  }

  FutureOr<void> _onStartProcessingOrder(OnStartProcessingOrder event, Emitter<BaseState> emit) {}
}
