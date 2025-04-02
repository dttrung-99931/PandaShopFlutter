import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class MainCommunication extends BlocCommunication<MainBloc> {
  @override
  void startCommunication(MainBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<LoginBloc>((state) {
      if (state is LogoutSuccess) {
        bloc.add(OnClearSavedAppMode());
      }
    });
  }
}
