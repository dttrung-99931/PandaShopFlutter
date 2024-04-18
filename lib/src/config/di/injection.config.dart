// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i13;
import '../../../core/utils/storage.dart' as _i12;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i55;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i100;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i99;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i14;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i101;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i102;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i103;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i104;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i105;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i49;
import '../../features/common/data/data_sources/user_data_source.dart' as _i43;
import '../../features/common/data/repos/address_repo_impl.dart' as _i51;
import '../../features/common/data/repos/user_repo_impl.dart' as _i45;
import '../../features/common/domain/repos/address_repo.dart' as _i50;
import '../../features/common/domain/repos/user_repo.dart' as _i44;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i63;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i64;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i66;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i74;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i90;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i77;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i27;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i5;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i97;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i98;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i20;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i96;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i79;
import '../../features/order/data/data_sources/order_data_source.dart' as _i21;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i24;
import '../../features/order/data/repos/order_repo_impl.dart' as _i23;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i26;
import '../../features/order/domain/repos/order_repo.dart' as _i22;
import '../../features/order/domain/repos/payment_repo.dart' as _i25;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i56;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i67;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i81;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i4;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i82;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i52;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i28;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i31;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i54;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i30;
import '../../features/product/data/repos/product_repo_impl.dart' as _i33;
import '../../features/product/domain/repos/ads_repo.dart' as _i53;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i29;
import '../../features/product/domain/repos/product_repo.dart' as _i32;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i73;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i65;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i59;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i62;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i68;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i69;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i70;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i34;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i41;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i85;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i7;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i91;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i35;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i46;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i37;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i48;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i36;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i47;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i16;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i18;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i57;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i60;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i71;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i78;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i89;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i84;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i86;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i83;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i87;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i6;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i9;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i88;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i92;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i10;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i93;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i94;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i11;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i38;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i40;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i39;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i61;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i75;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i76;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i42;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i95;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i80;
import 'injection.dart' as _i106; // ignore_for_file: unnecessary_lambdas

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
  final orderDatasourceProvider = _$OrderDatasourceProvider();
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
  gh.lazySingleton<_i4.OrderBlocCommunication>(
      () => _i4.OrderBlocCommunication());
  gh.lazySingleton<_i5.PickLocalImageUseCase>(
      () => _i5.PickLocalImageUseCase());
  gh.lazySingleton<_i6.ProductInventoryInputCommunication>(
      () => _i6.ProductInventoryInputCommunication());
  gh.lazySingleton<_i7.ProductOptionBloc>(() => _i7.ProductOptionBloc());
  gh.lazySingleton<_i8.ProductOptionCommunication>(
      () => _i8.ProductOptionCommunication());
  gh.lazySingleton<_i9.ProductOptionsInputBloc>(
      () => _i9.ProductOptionsInputBloc());
  gh.lazySingleton<_i10.ShopProductCommunication>(
      () => _i10.ShopProductCommunication());
  gh.lazySingleton<_i11.ShopProductDetailCommunication>(
      () => _i11.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i12.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i13.ApiInterceptor>(
      () => _i13.ApiInterceptor(get<_i12.Storage>()));
  gh.lazySingleton<_i14.CheckLoginUseCase>(
      () => _i14.CheckLoginUseCase(get<_i12.Storage>()));
  gh.singleton<_i15.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i13.ApiInterceptor>()));
  gh.lazySingleton<_i16.GetRememberLoginEmailUserCase>(
      () => _i16.GetRememberLoginEmailUserCase(get<_i12.Storage>()));
  gh.lazySingleton<_i17.GetRememberLoginEmailUserCase>(
      () => _i17.GetRememberLoginEmailUserCase(get<_i12.Storage>()));
  gh.lazySingleton<_i18.LogoutUseCase>(
      () => _i18.LogoutUseCase(get<_i12.Storage>()));
  gh.lazySingleton<_i19.LogoutUseCase>(
      () => _i19.LogoutUseCase(get<_i12.Storage>()));
  gh.lazySingleton<_i20.MainBloc>(() => _i20.MainBloc(get<_i12.Storage>()));
  gh.singleton<_i21.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i22.OrderRepo>(
      () => _i23.OrderRepoImpl(get<_i21.OrderDatasource>()));
  gh.singleton<_i24.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i25.PaymentRepo>(
      () => _i26.PaymentRepoImpl(get<_i24.PaymentDatasource>()));
  gh.lazySingleton<_i27.PickLocalImageAsBase64UseCase>(() =>
      _i27.PickLocalImageAsBase64UseCase(get<_i5.PickLocalImageUseCase>()));
  gh.singleton<_i28.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i29.ProductCateRepo>(
      () => _i30.ProductRepoImpl(get<_i28.ProductCateDatasource>()));
  gh.singleton<_i31.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i32.ProductRepo>(
      () => _i33.ProductRepoImpl(get<_i31.ProductRemoteDatasource>()));
  gh.lazySingleton<_i34.SearchProductsUserCase>(
      () => _i34.SearchProductsUserCase(get<_i32.ProductRepo>()));
  gh.singleton<_i35.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i36.ShopRepo>(
      () => _i37.ShopRepoImpl(get<_i35.ShopRemoteDatasource>()));
  gh.singleton<_i38.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i39.ShoppingCartRepo>(
      () => _i40.ShoppingCartRepoImpl(get<_i38.ShoppingCartDatasource>()));
  gh.lazySingleton<_i41.UpdateProductUseCase>(
      () => _i41.UpdateProductUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i42.UpsertCartItemUseCase>(
      () => _i42.UpsertCartItemUseCase(get<_i39.ShoppingCartRepo>()));
  gh.singleton<_i43.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i44.UserRepo>(
      () => _i45.UserRepoImpl(get<_i43.UserDatasource>()));
  gh.singleton<_i46.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i47.WarehouseRepo>(
      () => _i48.WarehouseRepoImpl(get<_i46.WarehouseRemoteDatasource>()));
  gh.singleton<_i49.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i50.AddressRepo>(
      () => _i51.AddressRepoImpl(get<_i49.AddressDatasource>()));
  gh.singleton<_i52.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i53.AdsRepo>(
      () => _i54.AdsRepoImpl(get<_i52.AdsDatasource>()));
  gh.singleton<_i55.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i56.CreateOrderUseCase>(
      () => _i56.CreateOrderUseCase(get<_i22.OrderRepo>()));
  gh.lazySingleton<_i57.CreateProductBatchesUseCase>(
      () => _i57.CreateProductBatchesUseCase(get<_i47.WarehouseRepo>()));
  gh.lazySingleton<_i58.CreateProductImagesUseCase>(
      () => _i58.CreateProductImagesUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i59.CreateProductUseCase>(
      () => _i59.CreateProductUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i60.CreateWarehouseInputUseCase>(
      () => _i60.CreateWarehouseInputUseCase(get<_i47.WarehouseRepo>()));
  gh.lazySingleton<_i61.DeleteCartItemsUseCase>(
      () => _i61.DeleteCartItemsUseCase(get<_i39.ShoppingCartRepo>()));
  gh.lazySingleton<_i62.DeleteProductUseCase>(
      () => _i62.DeleteProductUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i63.GetCommunesAndWardsUseCase>(
      () => _i63.GetCommunesAndWardsUseCase(get<_i50.AddressRepo>()));
  gh.lazySingleton<_i64.GetDistrictsUseCase>(
      () => _i64.GetDistrictsUseCase(get<_i50.AddressRepo>()));
  gh.lazySingleton<_i65.GetHomeBannersUseCase>(
      () => _i65.GetHomeBannersUseCase(get<_i53.AdsRepo>()));
  gh.lazySingleton<_i66.GetMyAddressesUseCase>(
      () => _i66.GetMyAddressesUseCase(get<_i50.AddressRepo>()));
  gh.lazySingleton<_i67.GetPaymentMethodsUseCase>(
      () => _i67.GetPaymentMethodsUseCase(get<_i25.PaymentRepo>()));
  gh.lazySingleton<_i68.GetProductCateByIdUseCase>(
      () => _i68.GetProductCateByIdUseCase(get<_i29.ProductCateRepo>()));
  gh.lazySingleton<_i69.GetProductCatesUseCase>(
      () => _i69.GetProductCatesUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i70.GetProductDetailUseCase>(
      () => _i70.GetProductDetailUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i71.GetProductInventoryUseCase>(
      () => _i71.GetProductInventoryUseCase(get<_i47.WarehouseRepo>()));
  gh.lazySingleton<_i72.GetProductsUseCase>(
      () => _i72.GetProductsUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i73.GetPropertyTemplateOfCateUseCase>(
      () => _i73.GetPropertyTemplateOfCateUseCase(get<_i32.ProductRepo>()));
  gh.lazySingleton<_i74.GetProvincesAndCitiesUseCase>(
      () => _i74.GetProvincesAndCitiesUseCase(get<_i50.AddressRepo>()));
  gh.lazySingleton<_i75.GetShoppingCartByIdUseCase>(
      () => _i75.GetShoppingCartByIdUseCase(get<_i39.ShoppingCartRepo>()));
  gh.lazySingleton<_i76.GetShoppingCartUseCase>(
      () => _i76.GetShoppingCartUseCase(get<_i39.ShoppingCartRepo>()));
  gh.lazySingleton<_i77.GetUserDetailUseCase>(
      () => _i77.GetUserDetailUseCase(get<_i44.UserRepo>()));
  gh.lazySingleton<_i78.GetWarehousesUseCase>(
      () => _i78.GetWarehousesUseCase(get<_i47.WarehouseRepo>()));
  gh.lazySingleton<_i79.HomeBloc>(() => _i79.HomeBloc(
        get<_i72.GetProductsUseCase>(),
        get<_i69.GetProductCatesUseCase>(),
        get<_i65.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i80.ImageInputBloc>(
      () => _i80.ImageInputBloc(get<_i27.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i81.OrderBloc>(
    () => _i81.OrderBloc(get<_i56.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i82.PaymentMethodInpBloc>(
      () => _i82.PaymentMethodInpBloc(get<_i67.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i83.ProductBatchInputBloc>(
      () => _i83.ProductBatchInputBloc(get<_i70.GetProductDetailUseCase>()));
  gh.lazySingleton<_i84.ProductCateInputBloc>(() => _i84.ProductCateInputBloc(
        get<_i69.GetProductCatesUseCase>(),
        get<_i68.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i85.ProductDetailBloc>(
      () => _i85.ProductDetailBloc(get<_i70.GetProductDetailUseCase>()));
  gh.lazySingleton<_i86.ProductInventoryBloc>(
      () => _i86.ProductInventoryBloc(get<_i71.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i87.ProductInventoryInputBloc>(
    () => _i87.ProductInventoryInputBloc(
      get<_i72.GetProductsUseCase>(),
      get<_i60.CreateWarehouseInputUseCase>(),
      get<_i57.CreateProductBatchesUseCase>(),
      get<_i78.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i88.ProductPropertiesInputBloc>(() =>
      _i88.ProductPropertiesInputBloc(
          get<_i73.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i89.RegisterShopUseCase>(
      () => _i89.RegisterShopUseCase(get<_i36.ShopRepo>()));
  gh.lazySingleton<_i90.SaveMyAddressUseCase>(
      () => _i90.SaveMyAddressUseCase(get<_i50.AddressRepo>()));
  gh.lazySingleton<_i91.SearchProductsBloc>(() => _i91.SearchProductsBloc(
        get<_i34.SearchProductsUserCase>(),
        get<_i72.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i92.ShopBloc>(
      () => _i92.ShopBloc(get<_i89.RegisterShopUseCase>()));
  gh.lazySingleton<_i93.ShopProductBloc>(() => _i93.ShopProductBloc(
        get<_i72.GetProductsUseCase>(),
        get<_i69.GetProductCatesUseCase>(),
        get<_i65.GetHomeBannersUseCase>(),
        get<_i62.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i94.ShopProductDetailBloc>(
    () => _i94.ShopProductDetailBloc(
      get<_i70.GetProductDetailUseCase>(),
      get<_i59.CreateProductUseCase>(),
      get<_i58.CreateProductImagesUseCase>(),
      get<_i41.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i95.ShoppingCartBloc>(() => _i95.ShoppingCartBloc(
        get<_i76.GetShoppingCartUseCase>(),
        get<_i42.UpsertCartItemUseCase>(),
        get<_i61.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i96.UserBloc>(
      () => _i96.UserBloc(get<_i77.GetUserDetailUseCase>()));
  gh.factory<_i97.AddressBloc>(() => _i97.AddressBloc(
        get<_i66.GetMyAddressesUseCase>(),
        get<_i74.GetProvincesAndCitiesUseCase>(),
        get<_i64.GetDistrictsUseCase>(),
        get<_i63.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i98.AddressInputBloc>(
      () => _i98.AddressInputBloc(get<_i90.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i99.AuthRepo>(
      () => _i100.AuthRepoImpl(get<_i55.AuthRepoteDatasource>()));
  gh.lazySingleton<_i101.EmailLoginUseCase>(() => _i101.EmailLoginUseCase(
        get<_i99.AuthRepo>(),
        get<_i12.Storage>(),
      ));
  gh.lazySingleton<_i102.QrBarcodeLoginUseCase>(
      () => _i102.QrBarcodeLoginUseCase(
            get<_i99.AuthRepo>(),
            get<_i101.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i103.SignUpUseCase>(
      () => _i103.SignUpUseCase(get<_i99.AuthRepo>()));
  gh.lazySingleton<_i104.LoginBloc>(() => _i104.LoginBloc(
        get<_i101.EmailLoginUseCase>(),
        get<_i102.QrBarcodeLoginUseCase>(),
        get<_i14.CheckLoginUseCase>(),
        get<_i19.LogoutUseCase>(),
        get<_i17.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i105.SignUpBloc>(
      () => _i105.SignUpBloc(get<_i103.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i106.AppModuleDepedenciesProvider {}

class _$OrderDatasourceProvider extends _i21.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i24.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i28.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i31.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i35.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i38.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i43.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i46.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i49.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i52.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i55.AuthRepoteDatasourceProvider {}
