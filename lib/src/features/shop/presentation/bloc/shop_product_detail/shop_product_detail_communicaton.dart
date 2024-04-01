import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart';
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/base_bloc/bloc_communication.dart';

@lazySingleton
class ShopProductDetailCommunication extends BlocCommunication<ShopProductDetailBloc> {
  @override
  void startCommunication(ShopProductDetailBloc bloc) {
    listenOtherBloc<ImageInputBloc>((state) {
      if (state is ImagesInputUpdated) {
        bloc.images = [...state.data];
      }
    });
    listenOtherBloc<ProductCateInputBloc>((state) {
      if (state is GetProductCatesSelectSucess && state.selected != null && state.selected!.level == 3) {
        bloc.productCateLv3 = state.selected;
      }
    });
    listenOtherBloc<ProductPropertiesInputBloc>((state) {
      if (state is ProductPropsUpdated) {
        bloc.propControllerMap = {...state.textControllerMap};
      }
    });
    listenOtherBloc<ProductOptionsInputBloc>((state) {
      if (state is ProductOptionsUpdated) {
        bloc.optionInputs = [...state.data];
      }
    });
  }
}
