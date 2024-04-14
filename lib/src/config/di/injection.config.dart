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
    as _i54;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i99;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i98;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i14;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i100;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i101;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i102;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i103;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i104;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i48;
import '../../features/common/data/data_sources/user_data_source.dart' as _i42;
import '../../features/common/data/repos/address_repo_impl.dart' as _i50;
import '../../features/common/data/repos/user_repo_impl.dart' as _i44;
import '../../features/common/domain/repos/address_repo.dart' as _i49;
import '../../features/common/domain/repos/user_repo.dart' as _i43;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i62;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i63;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i65;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i73;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i89;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i76;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i26;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i5;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i96;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i97;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i95;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i78;
import '../../features/order/data/data_sources/order_data_source.dart' as _i20;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i23;
import '../../features/order/data/repos/order_repo_impl.dart' as _i22;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i25;
import '../../features/order/domain/repos/order_repo.dart' as _i21;
import '../../features/order/domain/repos/payment_repo.dart' as _i24;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i55;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i66;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i80;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i4;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i81;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i51;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i27;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i30;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i53;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i29;
import '../../features/product/data/repos/product_repo_impl.dart' as _i32;
import '../../features/product/domain/repos/ads_repo.dart' as _i52;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i28;
import '../../features/product/domain/repos/product_repo.dart' as _i31;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i64;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i57;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i61;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i67;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i68;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i69;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i71;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i33;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i40;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i84;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i7;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i90;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i34;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i45;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i36;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i47;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i35;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i46;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i16;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i18;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i56;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i59;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i70;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i77;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i88;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i83;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i85;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i82;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i86;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i6;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i9;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i87;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i91;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i10;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i92;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i93;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i11;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i37;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i39;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i38;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i60;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i74;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i75;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i41;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i94;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i79;
import 'injection.dart' as _i105; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i20.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i21.OrderRepo>(
      () => _i22.OrderRepoImpl(get<_i20.OrderDatasource>()));
  gh.singleton<_i23.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i24.PaymentRepo>(
      () => _i25.PaymentRepoImpl(get<_i23.PaymentDatasource>()));
  gh.lazySingleton<_i26.PickLocalImageAsBase64UseCase>(() =>
      _i26.PickLocalImageAsBase64UseCase(get<_i5.PickLocalImageUseCase>()));
  gh.singleton<_i27.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i28.ProductCateRepo>(
      () => _i29.ProductRepoImpl(get<_i27.ProductCateDatasource>()));
  gh.singleton<_i30.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i31.ProductRepo>(
      () => _i32.ProductRepoImpl(get<_i30.ProductRemoteDatasource>()));
  gh.lazySingleton<_i33.SearchProductsUserCase>(
      () => _i33.SearchProductsUserCase(get<_i31.ProductRepo>()));
  gh.singleton<_i34.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i35.ShopRepo>(
      () => _i36.ShopRepoImpl(get<_i34.ShopRemoteDatasource>()));
  gh.singleton<_i37.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i38.ShoppingCartRepo>(
      () => _i39.ShoppingCartRepoImpl(get<_i37.ShoppingCartDatasource>()));
  gh.lazySingleton<_i40.UpdateProductUseCase>(
      () => _i40.UpdateProductUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i41.UpsertCartItemUseCase>(
      () => _i41.UpsertCartItemUseCase(get<_i38.ShoppingCartRepo>()));
  gh.singleton<_i42.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i43.UserRepo>(
      () => _i44.UserRepoImpl(get<_i42.UserDatasource>()));
  gh.singleton<_i45.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i46.WarehouseRepo>(
      () => _i47.WarehouseRepoImpl(get<_i45.WarehouseRemoteDatasource>()));
  gh.singleton<_i48.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i49.AddressRepo>(
      () => _i50.AddressRepoImpl(get<_i48.AddressDatasource>()));
  gh.singleton<_i51.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i52.AdsRepo>(
      () => _i53.AdsRepoImpl(get<_i51.AdsDatasource>()));
  gh.singleton<_i54.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i15.Dio>()));
  gh.lazySingleton<_i55.CreateOrderUseCase>(
      () => _i55.CreateOrderUseCase(get<_i21.OrderRepo>()));
  gh.lazySingleton<_i56.CreateProductBatchesUseCase>(
      () => _i56.CreateProductBatchesUseCase(get<_i46.WarehouseRepo>()));
  gh.lazySingleton<_i57.CreateProductImagesUseCase>(
      () => _i57.CreateProductImagesUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i58.CreateProductUseCase>(
      () => _i58.CreateProductUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i59.CreateWarehouseInputUseCase>(
      () => _i59.CreateWarehouseInputUseCase(get<_i46.WarehouseRepo>()));
  gh.lazySingleton<_i60.DeleteCartItemsUseCase>(
      () => _i60.DeleteCartItemsUseCase(get<_i38.ShoppingCartRepo>()));
  gh.lazySingleton<_i61.DeleteProductUseCase>(
      () => _i61.DeleteProductUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i62.GetCommunesAndWardsUseCase>(
      () => _i62.GetCommunesAndWardsUseCase(get<_i49.AddressRepo>()));
  gh.lazySingleton<_i63.GetDistrictsUseCase>(
      () => _i63.GetDistrictsUseCase(get<_i49.AddressRepo>()));
  gh.lazySingleton<_i64.GetHomeBannersUseCase>(
      () => _i64.GetHomeBannersUseCase(get<_i52.AdsRepo>()));
  gh.lazySingleton<_i65.GetMyAddressesUseCase>(
      () => _i65.GetMyAddressesUseCase(get<_i49.AddressRepo>()));
  gh.lazySingleton<_i66.GetPaymentMethodsUseCase>(
      () => _i66.GetPaymentMethodsUseCase(get<_i24.PaymentRepo>()));
  gh.lazySingleton<_i67.GetProductCateByIdUseCase>(
      () => _i67.GetProductCateByIdUseCase(get<_i28.ProductCateRepo>()));
  gh.lazySingleton<_i68.GetProductCatesUseCase>(
      () => _i68.GetProductCatesUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i69.GetProductDetailUseCase>(
      () => _i69.GetProductDetailUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i70.GetProductInventoryUseCase>(
      () => _i70.GetProductInventoryUseCase(get<_i46.WarehouseRepo>()));
  gh.lazySingleton<_i71.GetProductsUseCase>(
      () => _i71.GetProductsUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i72.GetPropertyTemplateOfCateUseCase>(
      () => _i72.GetPropertyTemplateOfCateUseCase(get<_i31.ProductRepo>()));
  gh.lazySingleton<_i73.GetProvincesAndCitiesUseCase>(
      () => _i73.GetProvincesAndCitiesUseCase(get<_i49.AddressRepo>()));
  gh.lazySingleton<_i74.GetShoppingCartByIdUseCase>(
      () => _i74.GetShoppingCartByIdUseCase(get<_i38.ShoppingCartRepo>()));
  gh.lazySingleton<_i75.GetShoppingCartUseCase>(
      () => _i75.GetShoppingCartUseCase(get<_i38.ShoppingCartRepo>()));
  gh.lazySingleton<_i76.GetUserDetailUseCase>(
      () => _i76.GetUserDetailUseCase(get<_i43.UserRepo>()));
  gh.lazySingleton<_i77.GetWarehousesUseCase>(
      () => _i77.GetWarehousesUseCase(get<_i46.WarehouseRepo>()));
  gh.lazySingleton<_i78.HomeBloc>(() => _i78.HomeBloc(
        get<_i71.GetProductsUseCase>(),
        get<_i68.GetProductCatesUseCase>(),
        get<_i64.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i79.ImageInputBloc>(
      () => _i79.ImageInputBloc(get<_i26.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i80.OrderBloc>(
    () => _i80.OrderBloc(get<_i55.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i81.PaymentMethodInpBloc>(
      () => _i81.PaymentMethodInpBloc(get<_i66.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i82.ProductBatchInputBloc>(
      () => _i82.ProductBatchInputBloc(get<_i69.GetProductDetailUseCase>()));
  gh.lazySingleton<_i83.ProductCateInputBloc>(() => _i83.ProductCateInputBloc(
        get<_i68.GetProductCatesUseCase>(),
        get<_i67.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i84.ProductDetailBloc>(
      () => _i84.ProductDetailBloc(get<_i69.GetProductDetailUseCase>()));
  gh.lazySingleton<_i85.ProductInventoryBloc>(
      () => _i85.ProductInventoryBloc(get<_i70.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i86.ProductInventoryInputBloc>(
    () => _i86.ProductInventoryInputBloc(
      get<_i71.GetProductsUseCase>(),
      get<_i59.CreateWarehouseInputUseCase>(),
      get<_i56.CreateProductBatchesUseCase>(),
      get<_i77.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i87.ProductPropertiesInputBloc>(() =>
      _i87.ProductPropertiesInputBloc(
          get<_i72.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i88.RegisterShopUseCase>(
      () => _i88.RegisterShopUseCase(get<_i35.ShopRepo>()));
  gh.lazySingleton<_i89.SaveMyAddressUseCase>(
      () => _i89.SaveMyAddressUseCase(get<_i49.AddressRepo>()));
  gh.lazySingleton<_i90.SearchProductsBloc>(() => _i90.SearchProductsBloc(
        get<_i33.SearchProductsUserCase>(),
        get<_i71.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i91.ShopBloc>(
      () => _i91.ShopBloc(get<_i88.RegisterShopUseCase>()));
  gh.lazySingleton<_i92.ShopProductBloc>(() => _i92.ShopProductBloc(
        get<_i71.GetProductsUseCase>(),
        get<_i68.GetProductCatesUseCase>(),
        get<_i64.GetHomeBannersUseCase>(),
        get<_i61.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i93.ShopProductDetailBloc>(
    () => _i93.ShopProductDetailBloc(
      get<_i69.GetProductDetailUseCase>(),
      get<_i58.CreateProductUseCase>(),
      get<_i57.CreateProductImagesUseCase>(),
      get<_i40.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i94.ShoppingCartBloc>(() => _i94.ShoppingCartBloc(
        get<_i75.GetShoppingCartUseCase>(),
        get<_i41.UpsertCartItemUseCase>(),
        get<_i60.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i95.UserBloc>(
      () => _i95.UserBloc(get<_i76.GetUserDetailUseCase>()));
  gh.factory<_i96.AddressBloc>(() => _i96.AddressBloc(
        get<_i65.GetMyAddressesUseCase>(),
        get<_i73.GetProvincesAndCitiesUseCase>(),
        get<_i63.GetDistrictsUseCase>(),
        get<_i62.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i97.AddressInputBloc>(
      () => _i97.AddressInputBloc(get<_i89.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i98.AuthRepo>(
      () => _i99.AuthRepoImpl(get<_i54.AuthRepoteDatasource>()));
  gh.lazySingleton<_i100.EmailLoginUseCase>(() => _i100.EmailLoginUseCase(
        get<_i98.AuthRepo>(),
        get<_i12.Storage>(),
      ));
  gh.lazySingleton<_i101.QrBarcodeLoginUseCase>(
      () => _i101.QrBarcodeLoginUseCase(
            get<_i98.AuthRepo>(),
            get<_i100.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i102.SignUpUseCase>(
      () => _i102.SignUpUseCase(get<_i98.AuthRepo>()));
  gh.lazySingleton<_i103.LoginBloc>(() => _i103.LoginBloc(
        get<_i100.EmailLoginUseCase>(),
        get<_i101.QrBarcodeLoginUseCase>(),
        get<_i14.CheckLoginUseCase>(),
        get<_i19.LogoutUseCase>(),
        get<_i17.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i104.SignUpBloc>(
      () => _i104.SignUpBloc(get<_i102.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i105.AppModuleDepedenciesProvider {}

class _$OrderDatasourceProvider extends _i20.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i23.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i27.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i30.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i34.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i37.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i42.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i45.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i48.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i51.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i54.AuthRepoteDatasourceProvider {}
