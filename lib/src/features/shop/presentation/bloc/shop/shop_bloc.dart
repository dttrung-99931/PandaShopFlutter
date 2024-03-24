import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

@lazySingleton
class SignUpBloc extends BaseBloc {
  final companyNameController = TextEditingController();

  final technicianNameController = TextEditingController();

  final labNameController = TextEditingController();

  final phoneController = TextEditingController();

  final postalCodeController = TextEditingController();

  final streetNameController = TextEditingController();

  final buildingNameController = TextEditingController();

  String? selectedDistrict;

  String? selectedWardName;

  SignUpBloc() : super(InitialState()) {
    // onLoad<OnEmailLogin>((event, emit) async {
    //   // TODO:
    // });
  }
}
