// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/order/domain/dto/create_orders_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/delivery_method_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/shop_response_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'delivery_method_inp_event.dart';
part 'delivery_method_inp_state.dart';

DeliveryMethodInpBloc get deliveryMethodInpBloc => getIt<DeliveryMethodInpBloc>();

@lazySingleton
class DeliveryMethodInpBloc extends BaseBloc {
  DeliveryMethodInpBloc() : super(InitialState()) {
    on<OnGetShopOrderDeliveryMethods>(_onGetShopOrderDeliveryMethods);
    on<OnDeliveryMethodSelected>(_onDeliveryMethodSelected);
  }

  final Map<ShopDto, List<DeliveryMethodDto>> deliveryMethodsByShop = {};

  FutureOr<void> _onGetShopOrderDeliveryMethods(OnGetShopOrderDeliveryMethods event, Emitter<BaseState> emit) async {
    emit(GetShopOrderDeliveryMethodsSuccess(
      event.subOrder.availableDeliveryMethods,
      selectedId: event.selectedId ??
          // TODO: fix chosse default selected
          event.subOrder.availableDeliveryMethods.lastOrNull?.id,
      shop: event.subOrder.shop,
    ));
  }

  FutureOr<void> _onDeliveryMethodSelected(OnDeliveryMethodSelected event, Emitter<BaseState> emit) {
    add(OnGetShopOrderDeliveryMethods(
      selectedId: event.selected?.id,
      subOrder: event.shopOrderConfirm,
    ));
  }
}
