// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:injectable/injectable.dart';

part 'address_input_event.dart';
part 'address_input_state.dart';

AddressInputBloc get addressInputBloc => getIt<AddressInputBloc>();

@lazySingleton
class AddressInputBloc extends BaseBloc with AddressBlocMixin {
  final GetMyAddressesUseCase _getMyAddresses;

  AddressInputBloc(this._getMyAddresses) : super(InitialState()) {}
}
