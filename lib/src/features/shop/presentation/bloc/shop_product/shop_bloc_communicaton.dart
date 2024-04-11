import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ShopProductCommunication extends BlocCommunication<ShopProductBloc> {
  @override
  void startCommunication(ShopProductBloc bloc) {
    super.startCommunication(bloc);
    listenOtherBloc<UserBloc>((state) {
      if (state is GetUserDetailSuccess) {
        if (state.data.shop != null) {
          bloc.add(OnGetShopProducts());
        }
      }
    });
  }
}
