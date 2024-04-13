// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/domain/dto/order_confirm_dto.dart';
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
  OrderBloc() : super(InitialState()) {
    onLoad<OnGetOrderComfirm>(_onGetOrderConfirm);
    on<OnChangeDeliveryMethod>(_onChangeDeliveryMethod);
    on<OnChangePaymentMethod>(_onChangePaymentMethod);
  }
  @override
  BlocCommunication? get blocCommunication => getIt<OrderBlocCommunication>();

  OrderConfirmDto? _orderConfirm;

  FutureOr<void> _onGetOrderConfirm(OnGetOrderComfirm event, Emitter<BaseState> emit) async {
    _orderConfirm = OrderConfirmDto(items: event.items);
    emit(GetOrderConfirmSuccess(_orderConfirm!));
  }

  FutureOr<void> _onChangeDeliveryMethod(OnChangeDeliveryMethod event, Emitter<BaseState> emit) {
    if (_orderConfirm != null) {
      _updateShopOrder(
        event.shop,
        (shopOrder) => shopOrder.copyWith(selectedDelivery: event.deliveryMethod),
      );
    }
  }

  void _updateShopOrder(ShopDto shop, ShopOrderComfirmDto Function(ShopOrderComfirmDto shopOrder) updater) {
    int index = _orderConfirm!.shopOrdersComfirms.indexWhere((element) => element.shop == shop);
    if (index != -1) {
      _orderConfirm?.shopOrdersComfirms[index] = updater(_orderConfirm!.shopOrdersComfirms[index]);
    }
  }

  FutureOr<void> _onChangePaymentMethod(OnChangePaymentMethod event, Emitter<BaseState> emit) {
    if (_orderConfirm != null) {
      _orderConfirm = _orderConfirm?.copyWith(selectedPayemntMethod: event.paymentMethod);
    }
  }
}
