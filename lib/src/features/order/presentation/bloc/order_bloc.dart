// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/log.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/order/data/models/request/create_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/create_orders_dto.dart';
import 'package:evievm_app/src/features/order/domain/use_cases/create_order_usecase.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc_communicaton.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/payement_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:evievm_app/src/features/shopping_cart/domain/dto/shopping_cart_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base_bloc/base_event.dart';

part 'order_event.dart';
part 'order_state.dart';

OrderBloc get orderBloc => getIt<OrderBloc>();

@lazySingleton
class OrderBloc extends BaseBloc {
  OrderBloc(
    this._createOrder,
  ) : super(InitialState()) {
    on<OnCreateOrderInput>(_onCreateOrderInput);
    on<OnChangeDeliveryMethod>(_onChangeDeliveryMethod);
    on<OnChangePaymentMethod>(_onChangePaymentMethod);
    on<OnChangeAddress>(_onChangeAddress);
    onLoad<OnCreateOrder>(_onCreateOrder, loadingBuilder: (_) => LoadingState<OnCreateOrder>());
  }
  @override
  BlocCommunication? get blocCommunication => getIt<OrderBlocCommunication>();
  final CreateOrderUseCase _createOrder;
  CreateOrdersDto? _order;

  FutureOr<void> _onCreateOrderInput(OnCreateOrderInput event, Emitter<BaseState> emit) async {
    _order = CreateOrdersDto.fromCartItems(items: event.items);
    emit(GetOrderConfirmSuccess(_order!));
  }

  FutureOr<void> _onChangeDeliveryMethod(OnChangeDeliveryMethod event, Emitter<BaseState> emit) {
    if (_order != null) {
      _updateSubOrder(
        event.shop,
        (shopOrder) => shopOrder.copyWith(selectedDelivery: event.deliveryMethod),
      );
    }
  }

  void _updateSubOrder(ShopDto shop, OrderInputDto Function(OrderInputDto shopOrder) updater) {
    int index = _order!.orderDetails.indexWhere((element) => element.shop == shop);
    if (index != -1) {
      _order?.orderDetails[index] = updater(_order!.orderDetails[index]);
    }
  }

  FutureOr<void> _onChangePaymentMethod(OnChangePaymentMethod event, Emitter<BaseState> emit) {
    if (_order != null) {
      _order = _order?.copyWith(selectedPayemntMethod: event.paymentMethod);
    }
  }

  @override
  bool validateMoreData() {
    return _order != null &&
        _order?.selectedPayemntMethod != null &&
        _order!.orderDetails.all(
          (OrderInputDto element) =>
              Validate.isValidId(element.selectedDelivery?.id) &&
              Validate.isValidId(
                element.selectedAddress?.id,
              ),
        );
  }

  FutureOr<void> _onCreateOrder(OnCreateOrder event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _createOrder.call(CreateOrdersRequestModel(
        paymentMethodId: _order!.selectedPayemntMethod!.id,
        note: '', // TODO
        orders: _order!.orderDetails.mapList(
          (subOrder) => OrderRequestModel(
            id: null,
            addressId: subOrder.selectedAddress!.id, // TODO
            deliveryMethodId: subOrder.selectedDelivery!.id,
            orderDetails: subOrder.items.mapList((detail) => OrderDetailRequestModel(
                  id: null,
                  productOptionId: detail.prouductOption.id,
                  productNum: detail.productNum,
                )),
          ),
        ),
      )),
      emit: emit,
      onSuccess: (dynamic _) {
        return CreatOrderSuccess();
      },
      onError: (failure) {
        return CreateOrderError(failure);
      },
    );
  }

  FutureOr<void> _onChangeAddress(OnChangeAddress event, Emitter<BaseState> emit) {
    if (_order != null) {
      _updateSubOrder(
        event.shop,
        (subOrder) => subOrder.copyWith(selectedAddress: event.address),
      );
    } else {
      loge('Change address for suborder  _order null ');
    }
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}
