import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:flutter/widgets.dart';

abstract class ValidationState<T extends StatefulWidget, Bloc extends BaseBloc> extends State<T> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getIt<Bloc>().add(OnSetFormValidateCallBack(() {
      return formKey.currentState?.validate() ?? false;
    }));
  }

  @override
  void dispose() {
    getIt<Bloc>().add(OnUnsetFormValidateCallBack());
    super.dispose();
  }
}
