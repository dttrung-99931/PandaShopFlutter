import 'dart:async';

import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocValidationMixin on Bloc<BaseEvent, BaseState> {
  bool Function()? _formValidateCallBack;

  void setupOnValidations() {
    on<OnValidateData>(_onValidateData, transformer: BlocConcurrency.sequential());
    on<OnSetFormValidateCallBack>(_onSetFormValidateCallBack);
    on<OnUnsetFormValidateCallBack>(_onUnsetFormValidateCallBack);
  }

  Future<void> _onValidateData(OnValidateData event, Emitter<BaseState> emit) async {
    handleValidate(emit, showErrMsg: event.showErrorMsg);
  }

  bool validateMoreData() {
    return true;
  }

  Future<void> _onSetFormValidateCallBack(OnSetFormValidateCallBack event, Emitter<BaseState> emit) async {
    _formValidateCallBack = event.formValidateCallBack;
  }

  Future<void> _onUnsetFormValidateCallBack(OnUnsetFormValidateCallBack event, Emitter<BaseState> emit) async {
    _formValidateCallBack = null;
  }

  bool handleValidate(Emitter<BaseState> emit, {bool showErrMsg = false}) {
    bool isValid = validate();
    emit(ValidateDataState(isValid, showErrorMsg: showErrMsg));
    return isValid;
  }

  bool validate() {
    return (_formValidateCallBack?.call() ?? true) && validateMoreData();
  }

  @override
  Future<void> close() {
    _formValidateCallBack = null;
    return super.close();
  }
}
