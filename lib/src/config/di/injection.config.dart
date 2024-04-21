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
    as _i56;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i103;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i102;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i18;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i104;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i105;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i106;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i107;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i108;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i50;
import '../../features/common/data/data_sources/user_data_source.dart' as _i44;
import '../../features/common/data/repos/address_repo_impl.dart' as _i52;
import '../../features/common/data/repos/user_repo_impl.dart' as _i46;
import '../../features/common/domain/repos/address_repo.dart' as _i51;
import '../../features/common/domain/repos/user_repo.dart' as _i45;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i64;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i65;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i67;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i76;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i92;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i79;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i28;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i6;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i100;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i101;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i21;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i4;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i99;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i81;
import '../../features/order/data/data_sources/order_data_source.dart' as _i22;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i25;
import '../../features/order/data/repos/order_repo_impl.dart' as _i24;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i27;
import '../../features/order/domain/repos/order_repo.dart' as _i23;
import '../../features/order/domain/repos/payment_repo.dart' as _i26;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i57;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i68;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i69;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i83;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i5;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i84;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i53;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i29;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i32;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i55;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i31;
import '../../features/product/data/repos/product_repo_impl.dart' as _i34;
import '../../features/product/domain/repos/ads_repo.dart' as _i54;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i30;
import '../../features/product/domain/repos/product_repo.dart' as _i33;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i75;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i66;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i59;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i60;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i63;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i70;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i71;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i74;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i35;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i42;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i87;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i8;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i9;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i93;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i36;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i47;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i38;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i49;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i37;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i48;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i58;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i61;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i73;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i80;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i91;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i86;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i88;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i85;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i89;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i7;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i10;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i90;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i94;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i95;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i11;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i96;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i97;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i12;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i39;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i41;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i40;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i62;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i77;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i78;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i43;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i98;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i82;
import 'injection.dart' as _i109; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.MainCommunication>(() => _i4.MainCommunication());
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
  gh.lazySingleton<_i21.MainBloc>(() => _i21.MainBloc(get<_i13.Storage>()));
  gh.singleton<_i22.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i23.OrderRepo>(
      () => _i24.OrderRepoImpl(get<_i22.OrderDatasource>()));
  gh.singleton<_i25.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i26.PaymentRepo>(
      () => _i27.PaymentRepoImpl(get<_i25.PaymentDatasource>()));
  gh.lazySingleton<_i28.PickLocalImageAsBase64UseCase>(() =>
      _i28.PickLocalImageAsBase64UseCase(get<_i6.PickLocalImageUseCase>()));
  gh.singleton<_i29.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i30.ProductCateRepo>(
      () => _i31.ProductRepoImpl(get<_i29.ProductCateDatasource>()));
  gh.singleton<_i32.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i33.ProductRepo>(
      () => _i34.ProductRepoImpl(get<_i32.ProductRemoteDatasource>()));
  gh.lazySingleton<_i35.SearchProductsUserCase>(
      () => _i35.SearchProductsUserCase(get<_i33.ProductRepo>()));
  gh.singleton<_i36.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i37.ShopRepo>(
      () => _i38.ShopRepoImpl(get<_i36.ShopRemoteDatasource>()));
  gh.singleton<_i39.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i40.ShoppingCartRepo>(
      () => _i41.ShoppingCartRepoImpl(get<_i39.ShoppingCartDatasource>()));
  gh.lazySingleton<_i42.UpdateProductUseCase>(
      () => _i42.UpdateProductUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i43.UpsertCartItemUseCase>(
      () => _i43.UpsertCartItemUseCase(get<_i40.ShoppingCartRepo>()));
  gh.singleton<_i44.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i45.UserRepo>(
      () => _i46.UserRepoImpl(get<_i44.UserDatasource>()));
  gh.singleton<_i47.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i48.WarehouseRepo>(
      () => _i49.WarehouseRepoImpl(get<_i47.WarehouseRemoteDatasource>()));
  gh.singleton<_i50.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i51.AddressRepo>(
      () => _i52.AddressRepoImpl(get<_i50.AddressDatasource>()));
  gh.singleton<_i53.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i54.AdsRepo>(
      () => _i55.AdsRepoImpl(get<_i53.AdsDatasource>()));
  gh.singleton<_i56.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i57.CreateOrderUseCase>(
      () => _i57.CreateOrderUseCase(get<_i23.OrderRepo>()));
  gh.lazySingleton<_i58.CreateProductBatchesUseCase>(
      () => _i58.CreateProductBatchesUseCase(get<_i48.WarehouseRepo>()));
  gh.lazySingleton<_i59.CreateProductImagesUseCase>(
      () => _i59.CreateProductImagesUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i60.CreateProductUseCase>(
      () => _i60.CreateProductUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i61.CreateWarehouseInputUseCase>(
      () => _i61.CreateWarehouseInputUseCase(get<_i48.WarehouseRepo>()));
  gh.lazySingleton<_i62.DeleteCartItemsUseCase>(
      () => _i62.DeleteCartItemsUseCase(get<_i40.ShoppingCartRepo>()));
  gh.lazySingleton<_i63.DeleteProductUseCase>(
      () => _i63.DeleteProductUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i64.GetCommunesAndWardsUseCase>(
      () => _i64.GetCommunesAndWardsUseCase(get<_i51.AddressRepo>()));
  gh.lazySingleton<_i65.GetDistrictsUseCase>(
      () => _i65.GetDistrictsUseCase(get<_i51.AddressRepo>()));
  gh.lazySingleton<_i66.GetHomeBannersUseCase>(
      () => _i66.GetHomeBannersUseCase(get<_i54.AdsRepo>()));
  gh.lazySingleton<_i67.GetMyAddressesUseCase>(
      () => _i67.GetMyAddressesUseCase(get<_i51.AddressRepo>()));
  gh.lazySingleton<_i68.GetOrdersUseCase>(
      () => _i68.GetOrdersUseCase(get<_i23.OrderRepo>()));
  gh.lazySingleton<_i69.GetPaymentMethodsUseCase>(
      () => _i69.GetPaymentMethodsUseCase(get<_i26.PaymentRepo>()));
  gh.lazySingleton<_i70.GetProductCateByIdUseCase>(
      () => _i70.GetProductCateByIdUseCase(get<_i30.ProductCateRepo>()));
  gh.lazySingleton<_i71.GetProductCatesUseCase>(
      () => _i71.GetProductCatesUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i72.GetProductDetailUseCase>(
      () => _i72.GetProductDetailUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i73.GetProductInventoryUseCase>(
      () => _i73.GetProductInventoryUseCase(get<_i48.WarehouseRepo>()));
  gh.lazySingleton<_i74.GetProductsUseCase>(
      () => _i74.GetProductsUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i75.GetPropertyTemplateOfCateUseCase>(
      () => _i75.GetPropertyTemplateOfCateUseCase(get<_i33.ProductRepo>()));
  gh.lazySingleton<_i76.GetProvincesAndCitiesUseCase>(
      () => _i76.GetProvincesAndCitiesUseCase(get<_i51.AddressRepo>()));
  gh.lazySingleton<_i77.GetShoppingCartByIdUseCase>(
      () => _i77.GetShoppingCartByIdUseCase(get<_i40.ShoppingCartRepo>()));
  gh.lazySingleton<_i78.GetShoppingCartUseCase>(
      () => _i78.GetShoppingCartUseCase(get<_i40.ShoppingCartRepo>()));
  gh.lazySingleton<_i79.GetUserDetailUseCase>(
      () => _i79.GetUserDetailUseCase(get<_i45.UserRepo>()));
  gh.lazySingleton<_i80.GetWarehousesUseCase>(
      () => _i80.GetWarehousesUseCase(get<_i48.WarehouseRepo>()));
  gh.lazySingleton<_i81.HomeBloc>(() => _i81.HomeBloc(
        get<_i74.GetProductsUseCase>(),
        get<_i71.GetProductCatesUseCase>(),
        get<_i66.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i82.ImageInputBloc>(
      () => _i82.ImageInputBloc(get<_i28.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i83.OrderBloc>(
    () => _i83.OrderBloc(get<_i57.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i84.PaymentMethodInpBloc>(
      () => _i84.PaymentMethodInpBloc(get<_i69.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i85.ProductBatchInputBloc>(
      () => _i85.ProductBatchInputBloc(get<_i72.GetProductDetailUseCase>()));
  gh.lazySingleton<_i86.ProductCateInputBloc>(() => _i86.ProductCateInputBloc(
        get<_i71.GetProductCatesUseCase>(),
        get<_i70.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i87.ProductDetailBloc>(
      () => _i87.ProductDetailBloc(get<_i72.GetProductDetailUseCase>()));
  gh.lazySingleton<_i88.ProductInventoryBloc>(
      () => _i88.ProductInventoryBloc(get<_i73.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i89.ProductInventoryInputBloc>(
    () => _i89.ProductInventoryInputBloc(
      get<_i74.GetProductsUseCase>(),
      get<_i61.CreateWarehouseInputUseCase>(),
      get<_i58.CreateProductBatchesUseCase>(),
      get<_i80.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i90.ProductPropertiesInputBloc>(() =>
      _i90.ProductPropertiesInputBloc(
          get<_i75.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i91.RegisterShopUseCase>(
      () => _i91.RegisterShopUseCase(get<_i37.ShopRepo>()));
  gh.lazySingleton<_i92.SaveMyAddressUseCase>(
      () => _i92.SaveMyAddressUseCase(get<_i51.AddressRepo>()));
  gh.lazySingleton<_i93.SearchProductsBloc>(() => _i93.SearchProductsBloc(
        get<_i35.SearchProductsUserCase>(),
        get<_i74.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i94.ShopBloc>(
      () => _i94.ShopBloc(get<_i91.RegisterShopUseCase>()));
  gh.lazySingleton<_i95.ShopOrderBloc>(
      () => _i95.ShopOrderBloc(get<_i68.GetOrdersUseCase>()));
  gh.lazySingleton<_i96.ShopProductBloc>(() => _i96.ShopProductBloc(
        get<_i74.GetProductsUseCase>(),
        get<_i71.GetProductCatesUseCase>(),
        get<_i66.GetHomeBannersUseCase>(),
        get<_i63.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i97.ShopProductDetailBloc>(
    () => _i97.ShopProductDetailBloc(
      get<_i72.GetProductDetailUseCase>(),
      get<_i60.CreateProductUseCase>(),
      get<_i59.CreateProductImagesUseCase>(),
      get<_i42.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i98.ShoppingCartBloc>(() => _i98.ShoppingCartBloc(
        get<_i78.GetShoppingCartUseCase>(),
        get<_i43.UpsertCartItemUseCase>(),
        get<_i62.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i99.UserBloc>(
      () => _i99.UserBloc(get<_i79.GetUserDetailUseCase>()));
  gh.factory<_i100.AddressBloc>(() => _i100.AddressBloc(
        get<_i67.GetMyAddressesUseCase>(),
        get<_i76.GetProvincesAndCitiesUseCase>(),
        get<_i65.GetDistrictsUseCase>(),
        get<_i64.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i101.AddressInputBloc>(
      () => _i101.AddressInputBloc(get<_i92.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i102.AuthRepo>(
      () => _i103.AuthRepoImpl(get<_i56.AuthRepoteDatasource>()));
  gh.lazySingleton<_i104.EmailLoginUseCase>(() => _i104.EmailLoginUseCase(
        get<_i102.AuthRepo>(),
        get<_i13.Storage>(),
      ));
  gh.lazySingleton<_i105.QrBarcodeLoginUseCase>(
      () => _i105.QrBarcodeLoginUseCase(
            get<_i102.AuthRepo>(),
            get<_i104.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i106.SignUpUseCase>(
      () => _i106.SignUpUseCase(get<_i102.AuthRepo>()));
  gh.lazySingleton<_i107.LoginBloc>(() => _i107.LoginBloc(
        get<_i104.EmailLoginUseCase>(),
        get<_i105.QrBarcodeLoginUseCase>(),
        get<_i15.CheckLoginUseCase>(),
        get<_i20.LogoutUseCase>(),
        get<_i18.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i108.SignUpBloc>(
      () => _i108.SignUpBloc(get<_i106.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i109.AppModuleDepedenciesProvider {}

class _$OrderDatasourceProvider extends _i22.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i25.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i29.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i32.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i36.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i39.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i44.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i47.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i50.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i53.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i56.AuthRepoteDatasourceProvider {}
