import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

SignUpBloc get signUpBloc => getIt();

@lazySingleton
class SignUpBloc extends BaseBloc {
  final phoneEdtController = TextEditingController();
  final passwordEdtController = TextEditingController();
  final passwordConfirmEdtController = TextEditingController();

  SignUpBloc() : super(InitialState()) {}
}
