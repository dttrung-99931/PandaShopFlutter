// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/temp_delivery_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_complete_processing_orders_usecase.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_delivering_orders_usecase.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/get_waiting_delivery_orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base_bloc/base_event.dart';

part 'shop_order_event.dart';
part 'shop_order_state.dart';

ShopOrderBloc get shopOrderBloc => getIt<ShopOrderBloc>();

@lazySingleton
class ShopOrderBloc extends BaseBloc {
  ShopOrderBloc(
    this._getOrders,
    this._getCompleteProcessingOrders,
    this._getWaitingDeliveryOrders,
    this._getDeliveringOrders,
  ) : super(InitialState()) {
    onLoad<OnGetShopOrders>(_onGetShopOrders);
    on<OnSelectOrderStatus>(_onSelectedOrderStatus);
  }

  final GetOrdersUseCase _getOrders;
  final GetCompleteProcessingOrdersUseCase _getCompleteProcessingOrders;
  final GetWaitingDeliveryOrdersUseCase _getWaitingDeliveryOrders;
  final GetDeliveringOrdersUseCase _getDeliveringOrders;
  final List<OrderStatus> _displayingOrderStatuses = [
    OrderStatus.pending,
    OrderStatus.created,
    OrderStatus.processing,
    OrderStatus.completeProcessing,
    OrderStatus.waitingForDelivering,
    OrderStatus.delivering,
    OrderStatus.completedByUser,
    OrderStatus.completedBySystem,
  ];
  OrderStatus _selectedStatus = OrderStatus.created;
  OrderStatus get selectedStatus => _selectedStatus;

  FutureOr<void> _onGetShopOrders(OnGetShopOrders event, Emitter<BaseState> emit) async {
    switch (event.orderStatus) {
      case OrderStatus.created:
      case OrderStatus.pending:
      case OrderStatus.processing:
      case OrderStatus.cancelledByBuyer:
      case OrderStatus.cancelledByShop:
      case OrderStatus.delivered:
      case OrderStatus.completedByUser:
      case OrderStatus.completedBySystem:
      case OrderStatus.lost:
        await handleUsecaseResult(
          usecaseResult: _getOrders.call(GetOrdersRequestModel(
            shopId: Global.shop?.id,
            status: event.orderStatus,
          )),
          emit: emit.call,
          onSuccess: (List<OrderDto> result) {
            return GetShopOrdersSuccess(result, orderStatus: _selectedStatus);
          },
        );
        break;
      case OrderStatus.completeProcessing:
        await handleUsecaseResult(
          usecaseResult: _getCompleteProcessingOrders.call(noParam),
          emit: emit.call,
          onSuccess: (List<TempDeliveryResponseDto> result) {
            return GetCompleteProcessingOrdersSuccess(result, orderStatus: _selectedStatus);
          },
        );
        break;
      case OrderStatus.waitingForDelivering:
        await handleUsecaseResult(
          usecaseResult: _getWaitingDeliveryOrders.call(noParam),
          emit: emit.call,
          onSuccess: (List<DeliveryWithOrdersResponseDto> result) {
            return GetWaitingDeliveryPartnerOrdersSuccess(result, orderStatus: _selectedStatus);
          },
        );
        break;
      case OrderStatus.delivering:
        await handleUsecaseResult(
          usecaseResult: _getDeliveringOrders.call(noParam),
          emit: emit.call,
          onSuccess: (List<DeliveryWithOrdersResponseDto> result) {
            return GetDeliveringOrdersSuccess(result, orderStatus: _selectedStatus);
          },
        );
        break;
      case null:
        loge('Cannot getting shop orders without status');
    }
  }

  FutureOr<void> _onSelectedOrderStatus(OnSelectOrderStatus event, Emitter<BaseState> emit) {
    _selectedStatus = event.selected!;
    add(OnGetShopOrders(orderStatus: event.selected!));
    emit(DisplayOrderStatusesUpdated(_displayingOrderStatuses, selectedId: event.selected));
  }
}
