// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc_mixin.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map/base_map_bloc.dart';
import 'package:injectable/injectable.dart';

part 'map_address_event.dart';
part 'map_address_state.dart';

MapAddressBloc get mapAddressBloc => getIt<MapAddressBloc>();

@lazySingleton
class MapAddressBloc extends BaseMapBloc with AddressBlocMixin {
  MapAddressBloc() : super();
}
