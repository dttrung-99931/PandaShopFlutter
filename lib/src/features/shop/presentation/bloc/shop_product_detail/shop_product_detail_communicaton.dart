import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/product/domain/dto/product/product_detail_dto.dart';
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
    super.startCommunication(bloc);
    listenOtherBloc<ImageInputBloc>((state) {
      if (state is ImagesInputUpdated) {
        bloc.images = [...state.data];
      }
    });
    listenOtherBloc<ProductCateInputBloc>((state) {
      if (state is GetProductCatesSelectSucess &&
          state.selected != null &&
          state.selected!.level == 3 &&
          state.selected?.id != Constatnts.idEmpty) {
        bloc.productCateLv3 = state.selected;
        if (bloc.isCreateMode) {
          productPropsInputBloc.add(OnGetPropertyTemplateOfCate(cateId: state.selectedId!));
        }
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
      if (state is OptionPropsUpdated) {
        productPropsInputBloc.add(OnOptionPropsUpdated(optionPropUpdated: state));
      }
    });
    listenSelf((state) {
      if (state is InitShopProductSuccess) {
        ProductDetailDto? product = state.productDetail;
        inputProductCateBloc.add(OnGetSelectedProductCates(productCategoryId: product?.categoryId));
        if (product?.options != null) {
          productOptionsInputBloc.add(OnInitProductOptions(options: product!.options));
        }
        if (product?.propertyValues.isNotEmpty == true) {
          productPropsInputBloc.add(
            OnInitPropertyValues(propValues: product!.propertyValues),
          );
        }
      }
    });
  }

  @override
  void stopCommunication() {
    super.stopCommunication();
    getIt.resetLazySingleton<ProductPropertiesInputBloc>();
    getIt.resetLazySingleton<ProductOptionsInputBloc>();
    getIt.resetLazySingleton<ProductCateInputBloc>();
    getIt.resetLazySingleton<ImageInputBloc>();
  }
}
