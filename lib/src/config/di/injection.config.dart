// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i14;
import '../../../core/utils/storage.dart' as _i13;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i52;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i95;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i94;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i18;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i96;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i97;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i98;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i99;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i100;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i46;
import '../../features/common/data/data_sources/user_data_source.dart' as _i40;
import '../../features/common/data/repos/address_repo_impl.dart' as _i48;
import '../../features/common/data/repos/user_repo_impl.dart' as _i42;
import '../../features/common/domain/repos/address_repo.dart' as _i47;
import '../../features/common/domain/repos/user_repo.dart' as _i41;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i59;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i60;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i62;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i70;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i85;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i73;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i24;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i6;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i92;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i93;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i91;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i75;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i21;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i23;
import '../../features/order/domain/repos/payment_repo.dart' as _i22;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i63;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i4;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i5;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i77;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i49;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i25;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i28;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i51;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i27;
import '../../features/product/data/repos/product_repo_impl.dart' as _i30;
import '../../features/product/domain/repos/ads_repo.dart' as _i50;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i26;
import '../../features/product/domain/repos/product_repo.dart' as _i29;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i69;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i61;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i54;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i55;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i64;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i65;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i66;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i68;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i31;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i38;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i80;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i8;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i9;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i86;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i32;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i43;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i34;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i45;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i33;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i44;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i53;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i56;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i67;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i74;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i84;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i79;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i81;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i78;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i82;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i7;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i10;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i83;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i87;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i11;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i88;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i89;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i12;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i35;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i37;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i36;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i57;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i71;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i72;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i39;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i90;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i76;
import 'injection.dart' as _i101; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModuleDepedenciesProvider = _$AppModuleDepedenciesProvider();
  final paymentDatasourceProvider = _$PaymentDatasourceProvider();
  final productCateDatasourceProvider = _$ProductCateDatasourceProvider();
  final productRemoteDatasourceProvider = _$ProductRemoteDatasourceProvider();
  final shopRepoteDatasourceProvider = _$ShopRepoteDatasourceProvider();
  final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
  final userDatasourceProvider = _$UserDatasourceProvider();
  final warehouseRemoteDatasourceProvider =
      _$WarehouseRemoteDatasourceProvider();
  final addressDatasourceProvider = _$AddressDatasourceProvider();
  final adsDatasourceProvider = _$AdsDatasourceProvider();
  final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
  gh.lazySingleton<_i3.DeliveryMethodInpBloc>(
      () => _i3.DeliveryMethodInpBloc());
  gh.lazySingleton<_i4.OrderBloc>(() => _i4.OrderBloc());
  gh.lazySingleton<_i5.OrderBlocCommunication>(
      () => _i5.OrderBlocCommunication());
  gh.lazySingleton<_i6.PickLocalImageUseCase>(
      () => _i6.PickLocalImageUseCase());
  gh.lazySingleton<_i7.ProductInventoryInputCommunication>(
      () => _i7.ProductInventoryInputCommunication());
  gh.lazySingleton<_i8.ProductOptionBloc>(() => _i8.ProductOptionBloc());
  gh.lazySingleton<_i9.ProductOptionCommunication>(
      () => _i9.ProductOptionCommunication());
  gh.lazySingleton<_i10.ProductOptionsInputBloc>(
      () => _i10.ProductOptionsInputBloc());
  gh.lazySingleton<_i11.ShopProductCommunication>(
      () => _i11.ShopProductCommunication());
  gh.lazySingleton<_i12.ShopProductDetailCommunication>(
      () => _i12.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i13.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i14.ApiInterceptor>(
      () => _i14.ApiInterceptor(get<_i13.Storage>()));
  gh.lazySingleton<_i15.CheckLoginUseCase>(
      () => _i15.CheckLoginUseCase(get<_i13.Storage>()));
  gh.singleton<_i16.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i14.ApiInterceptor>()));
  gh.lazySingleton<_i17.GetRememberLoginEmailUserCase>(
      () => _i17.GetRememberLoginEmailUserCase(get<_i13.Storage>()));
  gh.lazySingleton<_i18.GetRememberLoginEmailUserCase>(
      () => _i18.GetRememberLoginEmailUserCase(get<_i13.Storage>()));
  gh.lazySingleton<_i19.LogoutUseCase>(
      () => _i19.LogoutUseCase(get<_i13.Storage>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(get<_i13.Storage>()));
  gh.singleton<_i21.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i22.PaymentRepo>(
      () => _i23.PaymentRepoImpl(get<_i21.PaymentDatasource>()));
  gh.lazySingleton<_i24.PickLocalImageAsBase64UseCase>(() =>
      _i24.PickLocalImageAsBase64UseCase(get<_i6.PickLocalImageUseCase>()));
  gh.singleton<_i25.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i26.ProductCateRepo>(
      () => _i27.ProductRepoImpl(get<_i25.ProductCateDatasource>()));
  gh.singleton<_i28.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i29.ProductRepo>(
      () => _i30.ProductRepoImpl(get<_i28.ProductRemoteDatasource>()));
  gh.lazySingleton<_i31.SearchProductsUserCase>(
      () => _i31.SearchProductsUserCase(get<_i29.ProductRepo>()));
  gh.singleton<_i32.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i33.ShopRepo>(
      () => _i34.ShopRepoImpl(get<_i32.ShopRemoteDatasource>()));
  gh.singleton<_i35.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i36.ShoppingCartRepo>(
      () => _i37.ShoppingCartRepoImpl(get<_i35.ShoppingCartDatasource>()));
  gh.lazySingleton<_i38.UpdateProductUseCase>(
      () => _i38.UpdateProductUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i39.UpsertCartItemUseCase>(
      () => _i39.UpsertCartItemUseCase(get<_i36.ShoppingCartRepo>()));
  gh.singleton<_i40.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i41.UserRepo>(
      () => _i42.UserRepoImpl(get<_i40.UserDatasource>()));
  gh.singleton<_i43.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i44.WarehouseRepo>(
      () => _i45.WarehouseRepoImpl(get<_i43.WarehouseRemoteDatasource>()));
  gh.singleton<_i46.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i47.AddressRepo>(
      () => _i48.AddressRepoImpl(get<_i46.AddressDatasource>()));
  gh.singleton<_i49.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i50.AdsRepo>(
      () => _i51.AdsRepoImpl(get<_i49.AdsDatasource>()));
  gh.singleton<_i52.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i53.CreateProductBatchesUseCase>(
      () => _i53.CreateProductBatchesUseCase(get<_i44.WarehouseRepo>()));
  gh.lazySingleton<_i54.CreateProductImagesUseCase>(
      () => _i54.CreateProductImagesUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i55.CreateProductUseCase>(
      () => _i55.CreateProductUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i56.CreateWarehouseInputUseCase>(
      () => _i56.CreateWarehouseInputUseCase(get<_i44.WarehouseRepo>()));
  gh.lazySingleton<_i57.DeleteCartItemsUseCase>(
      () => _i57.DeleteCartItemsUseCase(get<_i36.ShoppingCartRepo>()));
  gh.lazySingleton<_i58.DeleteProductUseCase>(
      () => _i58.DeleteProductUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i59.GetCommunesAndWardsUseCase>(
      () => _i59.GetCommunesAndWardsUseCase(get<_i47.AddressRepo>()));
  gh.lazySingleton<_i60.GetDistrictsUseCase>(
      () => _i60.GetDistrictsUseCase(get<_i47.AddressRepo>()));
  gh.lazySingleton<_i61.GetHomeBannersUseCase>(
      () => _i61.GetHomeBannersUseCase(get<_i50.AdsRepo>()));
  gh.lazySingleton<_i62.GetMyAddressesUseCase>(
      () => _i62.GetMyAddressesUseCase(get<_i47.AddressRepo>()));
  gh.lazySingleton<_i63.GetPaymentMethodsUseCase>(
      () => _i63.GetPaymentMethodsUseCase(get<_i22.PaymentRepo>()));
  gh.lazySingleton<_i64.GetProductCateByIdUseCase>(
      () => _i64.GetProductCateByIdUseCase(get<_i26.ProductCateRepo>()));
  gh.lazySingleton<_i65.GetProductCatesUseCase>(
      () => _i65.GetProductCatesUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i66.GetProductDetailUseCase>(
      () => _i66.GetProductDetailUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i67.GetProductInventoryUseCase>(
      () => _i67.GetProductInventoryUseCase(get<_i44.WarehouseRepo>()));
  gh.lazySingleton<_i68.GetProductsUseCase>(
      () => _i68.GetProductsUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i69.GetPropertyTemplateOfCateUseCase>(
      () => _i69.GetPropertyTemplateOfCateUseCase(get<_i29.ProductRepo>()));
  gh.lazySingleton<_i70.GetProvincesAndCitiesUseCase>(
      () => _i70.GetProvincesAndCitiesUseCase(get<_i47.AddressRepo>()));
  gh.lazySingleton<_i71.GetShoppingCartByIdUseCase>(
      () => _i71.GetShoppingCartByIdUseCase(get<_i36.ShoppingCartRepo>()));
  gh.lazySingleton<_i72.GetShoppingCartUseCase>(
      () => _i72.GetShoppingCartUseCase(get<_i36.ShoppingCartRepo>()));
  gh.lazySingleton<_i73.GetUserDetailUseCase>(
      () => _i73.GetUserDetailUseCase(get<_i41.UserRepo>()));
  gh.lazySingleton<_i74.GetWarehousesUseCase>(
      () => _i74.GetWarehousesUseCase(get<_i44.WarehouseRepo>()));
  gh.lazySingleton<_i75.HomeBloc>(() => _i75.HomeBloc(
        get<_i68.GetProductsUseCase>(),
        get<_i65.GetProductCatesUseCase>(),
        get<_i61.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i76.ImageInputBloc>(
      () => _i76.ImageInputBloc(get<_i24.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i77.PaymentMethodInpBloc>(
      () => _i77.PaymentMethodInpBloc(get<_i63.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i78.ProductBatchInputBloc>(
      () => _i78.ProductBatchInputBloc(get<_i66.GetProductDetailUseCase>()));
  gh.lazySingleton<_i79.ProductCateInputBloc>(() => _i79.ProductCateInputBloc(
        get<_i65.GetProductCatesUseCase>(),
        get<_i64.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i80.ProductDetailBloc>(
      () => _i80.ProductDetailBloc(get<_i66.GetProductDetailUseCase>()));
  gh.lazySingleton<_i81.ProductInventoryBloc>(
      () => _i81.ProductInventoryBloc(get<_i67.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i82.ProductInventoryInputBloc>(
    () => _i82.ProductInventoryInputBloc(
      get<_i68.GetProductsUseCase>(),
      get<_i56.CreateWarehouseInputUseCase>(),
      get<_i53.CreateProductBatchesUseCase>(),
      get<_i74.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i83.ProductPropertiesInputBloc>(() =>
      _i83.ProductPropertiesInputBloc(
          get<_i69.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i84.RegisterShopUseCase>(
      () => _i84.RegisterShopUseCase(get<_i33.ShopRepo>()));
  gh.lazySingleton<_i85.SaveMyAddressUseCase>(
      () => _i85.SaveMyAddressUseCase(get<_i47.AddressRepo>()));
  gh.lazySingleton<_i86.SearchProductsBloc>(() => _i86.SearchProductsBloc(
        get<_i31.SearchProductsUserCase>(),
        get<_i68.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i87.ShopBloc>(
      () => _i87.ShopBloc(get<_i84.RegisterShopUseCase>()));
  gh.lazySingleton<_i88.ShopProductBloc>(() => _i88.ShopProductBloc(
        get<_i68.GetProductsUseCase>(),
        get<_i65.GetProductCatesUseCase>(),
        get<_i61.GetHomeBannersUseCase>(),
        get<_i58.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i89.ShopProductDetailBloc>(
    () => _i89.ShopProductDetailBloc(
      get<_i66.GetProductDetailUseCase>(),
      get<_i55.CreateProductUseCase>(),
      get<_i54.CreateProductImagesUseCase>(),
      get<_i38.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i90.ShoppingCartBloc>(() => _i90.ShoppingCartBloc(
        get<_i72.GetShoppingCartUseCase>(),
        get<_i39.UpsertCartItemUseCase>(),
        get<_i57.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i91.UserBloc>(
      () => _i91.UserBloc(get<_i73.GetUserDetailUseCase>()));
  gh.factory<_i92.AddressBloc>(() => _i92.AddressBloc(
        get<_i62.GetMyAddressesUseCase>(),
        get<_i70.GetProvincesAndCitiesUseCase>(),
        get<_i60.GetDistrictsUseCase>(),
        get<_i59.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i93.AddressInputBloc>(
      () => _i93.AddressInputBloc(get<_i85.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i94.AuthRepo>(
      () => _i95.AuthRepoImpl(get<_i52.AuthRepoteDatasource>()));
  gh.lazySingleton<_i96.EmailLoginUseCase>(() => _i96.EmailLoginUseCase(
        get<_i94.AuthRepo>(),
        get<_i13.Storage>(),
      ));
  gh.lazySingleton<_i97.QrBarcodeLoginUseCase>(() => _i97.QrBarcodeLoginUseCase(
        get<_i94.AuthRepo>(),
        get<_i96.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i98.SignUpUseCase>(
      () => _i98.SignUpUseCase(get<_i94.AuthRepo>()));
  gh.lazySingleton<_i99.LoginBloc>(() => _i99.LoginBloc(
        get<_i96.EmailLoginUseCase>(),
        get<_i97.QrBarcodeLoginUseCase>(),
        get<_i15.CheckLoginUseCase>(),
        get<_i19.LogoutUseCase>(),
        get<_i18.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i100.SignUpBloc>(
      () => _i100.SignUpBloc(get<_i98.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i101.AppModuleDepedenciesProvider {}

class _$PaymentDatasourceProvider extends _i21.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i25.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i28.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i32.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i35.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i40.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i43.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i46.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i49.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i52.AuthRepoteDatasourceProvider {}
