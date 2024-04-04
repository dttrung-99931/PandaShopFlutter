// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/shop/data/models/request/shop_request_model.dart';
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart';

part 'shop_event.dart';
part 'shop_state.dart';

ShopBloc get shopBloc => getIt();

@lazySingleton
class ShopBloc extends BaseBloc {
  final nameController = TextEditingController();
  final RegisterShopUseCase _registerShop;

  ShopBloc(
    this._registerShop,
  ) : super(InitialState()) {
    onLoad<OnRegisterShop>(_onRegisterShop);
  }

  FutureOr<void> _onRegisterShop(OnRegisterShop event, Emitter<BaseState> emit) async {
    await handleUsecaseResult(
      usecaseResult: _registerShop.call(
        ShopParams(
          userId: Global.userDetail!.id,
          shop: ShopRequestModel(id: null, name: nameController.text),
        ),
      ),
      emit: emit,
      onSuccess: (_) {
        return RegisterShopSuccess();
      },
    );
  }
}
