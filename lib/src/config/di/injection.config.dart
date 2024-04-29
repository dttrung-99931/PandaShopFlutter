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
    as _i60;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i111;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i110;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i112;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i113;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i114;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i115;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i116;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i54;
import '../../features/common/data/data_sources/user_data_source.dart' as _i48;
import '../../features/common/data/repos/address_repo_impl.dart' as _i56;
import '../../features/common/data/repos/user_repo_impl.dart' as _i50;
import '../../features/common/domain/repos/address_repo.dart' as _i55;
import '../../features/common/domain/repos/user_repo.dart' as _i49;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i69;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i70;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i72;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i82;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i100;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i85;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i31;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i6;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i108;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i109;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i21;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i4;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i107;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i87;
import '../../features/notification/data/data_sources/notification_data_source.dart'
    as _i22;
import '../../features/notification/data/repos/notification_repo_impl.dart'
    as _i24;
import '../../features/notification/domain/repos/notification_repo.dart'
    as _i23;
import '../../features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i73;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i89;
import '../../features/order/data/data_sources/order_data_source.dart' as _i25;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i28;
import '../../features/order/data/repos/order_repo_impl.dart' as _i27;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i30;
import '../../features/order/domain/repos/order_repo.dart' as _i26;
import '../../features/order/domain/repos/payment_repo.dart' as _i29;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i62;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i74;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i75;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i90;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i5;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i92;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i57;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i32;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i35;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i59;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i34;
import '../../features/product/data/repos/product_repo_impl.dart' as _i37;
import '../../features/product/domain/repos/ads_repo.dart' as _i58;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i33;
import '../../features/product/domain/repos/product_repo.dart' as _i36;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i81;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i71;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i64;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i65;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i68;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i76;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i77;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i78;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i80;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i38;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i46;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i95;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i8;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i9;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i101;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i39;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i51;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i41;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i53;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i40;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i52;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i18;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i63;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i66;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i79;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i86;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i99;
import '../../features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i61;
import '../../features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i45;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i94;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i96;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i93;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i97;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i7;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i10;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i98;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i102;
import '../../features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i91;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i103;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i11;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i104;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i105;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i12;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i42;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i44;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i43;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i67;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i83;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i84;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i47;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i106;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i88;
import 'injection.dart' as _i117; // ignore_for_file: unnecessary_lambdas

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
  final notificationDatasourceProvider = _$NotificationDatasourceProvider();
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
  gh.singleton<_i22.NotificationDatasource>(notificationDatasourceProvider
      .provideNotificationDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i23.NotificationRepo>(
      () => _i24.NotificationRepoImpl(get<_i22.NotificationDatasource>()));
  gh.singleton<_i25.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i26.OrderRepo>(
      () => _i27.OrderRepoImpl(get<_i25.OrderDatasource>()));
  gh.singleton<_i28.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i29.PaymentRepo>(
      () => _i30.PaymentRepoImpl(get<_i28.PaymentDatasource>()));
  gh.lazySingleton<_i31.PickLocalImageAsBase64UseCase>(() =>
      _i31.PickLocalImageAsBase64UseCase(get<_i6.PickLocalImageUseCase>()));
  gh.singleton<_i32.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i33.ProductCateRepo>(
      () => _i34.ProductRepoImpl(get<_i32.ProductCateDatasource>()));
  gh.singleton<_i35.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i36.ProductRepo>(
      () => _i37.ProductRepoImpl(get<_i35.ProductRemoteDatasource>()));
  gh.lazySingleton<_i38.SearchProductsUserCase>(
      () => _i38.SearchProductsUserCase(get<_i36.ProductRepo>()));
  gh.singleton<_i39.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i40.ShopRepo>(
      () => _i41.ShopRepoImpl(get<_i39.ShopRemoteDatasource>()));
  gh.singleton<_i42.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i43.ShoppingCartRepo>(
      () => _i44.ShoppingCartRepoImpl(get<_i42.ShoppingCartDatasource>()));
  gh.lazySingleton<_i45.StartProcessingOrderUseCase>(
      () => _i45.StartProcessingOrderUseCase(get<_i26.OrderRepo>()));
  gh.lazySingleton<_i46.UpdateProductUseCase>(
      () => _i46.UpdateProductUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i47.UpsertCartItemUseCase>(
      () => _i47.UpsertCartItemUseCase(get<_i43.ShoppingCartRepo>()));
  gh.singleton<_i48.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i49.UserRepo>(
      () => _i50.UserRepoImpl(get<_i48.UserDatasource>()));
  gh.singleton<_i51.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i52.WarehouseRepo>(
      () => _i53.WarehouseRepoImpl(get<_i51.WarehouseRemoteDatasource>()));
  gh.singleton<_i54.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i55.AddressRepo>(
      () => _i56.AddressRepoImpl(get<_i54.AddressDatasource>()));
  gh.singleton<_i57.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i58.AdsRepo>(
      () => _i59.AdsRepoImpl(get<_i57.AdsDatasource>()));
  gh.singleton<_i60.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i61.CompleteProcessingOrderUseCase>(
      () => _i61.CompleteProcessingOrderUseCase(get<_i26.OrderRepo>()));
  gh.lazySingleton<_i62.CreateOrderUseCase>(
      () => _i62.CreateOrderUseCase(get<_i26.OrderRepo>()));
  gh.lazySingleton<_i63.CreateProductBatchesUseCase>(
      () => _i63.CreateProductBatchesUseCase(get<_i52.WarehouseRepo>()));
  gh.lazySingleton<_i64.CreateProductImagesUseCase>(
      () => _i64.CreateProductImagesUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i65.CreateProductUseCase>(
      () => _i65.CreateProductUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i66.CreateWarehouseInputUseCase>(
      () => _i66.CreateWarehouseInputUseCase(get<_i52.WarehouseRepo>()));
  gh.lazySingleton<_i67.DeleteCartItemsUseCase>(
      () => _i67.DeleteCartItemsUseCase(get<_i43.ShoppingCartRepo>()));
  gh.lazySingleton<_i68.DeleteProductUseCase>(
      () => _i68.DeleteProductUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i69.GetCommunesAndWardsUseCase>(
      () => _i69.GetCommunesAndWardsUseCase(get<_i55.AddressRepo>()));
  gh.lazySingleton<_i70.GetDistrictsUseCase>(
      () => _i70.GetDistrictsUseCase(get<_i55.AddressRepo>()));
  gh.lazySingleton<_i71.GetHomeBannersUseCase>(
      () => _i71.GetHomeBannersUseCase(get<_i58.AdsRepo>()));
  gh.lazySingleton<_i72.GetMyAddressesUseCase>(
      () => _i72.GetMyAddressesUseCase(get<_i55.AddressRepo>()));
  gh.lazySingleton<_i73.GetNotificationsUseCase>(
      () => _i73.GetNotificationsUseCase(get<_i23.NotificationRepo>()));
  gh.lazySingleton<_i74.GetOrdersUseCase>(
      () => _i74.GetOrdersUseCase(get<_i26.OrderRepo>()));
  gh.lazySingleton<_i75.GetPaymentMethodsUseCase>(
      () => _i75.GetPaymentMethodsUseCase(get<_i29.PaymentRepo>()));
  gh.lazySingleton<_i76.GetProductCateByIdUseCase>(
      () => _i76.GetProductCateByIdUseCase(get<_i33.ProductCateRepo>()));
  gh.lazySingleton<_i77.GetProductCatesUseCase>(
      () => _i77.GetProductCatesUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i78.GetProductDetailUseCase>(
      () => _i78.GetProductDetailUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i79.GetProductInventoryUseCase>(
      () => _i79.GetProductInventoryUseCase(get<_i52.WarehouseRepo>()));
  gh.lazySingleton<_i80.GetProductsUseCase>(
      () => _i80.GetProductsUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i81.GetPropertyTemplateOfCateUseCase>(
      () => _i81.GetPropertyTemplateOfCateUseCase(get<_i36.ProductRepo>()));
  gh.lazySingleton<_i82.GetProvincesAndCitiesUseCase>(
      () => _i82.GetProvincesAndCitiesUseCase(get<_i55.AddressRepo>()));
  gh.lazySingleton<_i83.GetShoppingCartByIdUseCase>(
      () => _i83.GetShoppingCartByIdUseCase(get<_i43.ShoppingCartRepo>()));
  gh.lazySingleton<_i84.GetShoppingCartUseCase>(
      () => _i84.GetShoppingCartUseCase(get<_i43.ShoppingCartRepo>()));
  gh.lazySingleton<_i85.GetUserDetailUseCase>(
      () => _i85.GetUserDetailUseCase(get<_i49.UserRepo>()));
  gh.lazySingleton<_i86.GetWarehousesUseCase>(
      () => _i86.GetWarehousesUseCase(get<_i52.WarehouseRepo>()));
  gh.lazySingleton<_i87.HomeBloc>(() => _i87.HomeBloc(
        get<_i80.GetProductsUseCase>(),
        get<_i77.GetProductCatesUseCase>(),
        get<_i71.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i88.ImageInputBloc>(
      () => _i88.ImageInputBloc(get<_i31.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i89.NotificationBloc>(
      () => _i89.NotificationBloc(get<_i73.GetNotificationsUseCase>()));
  gh.lazySingleton<_i90.OrderBloc>(
    () => _i90.OrderBloc(get<_i62.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i91.OrderProcessBloc>(() => _i91.OrderProcessBloc(
        get<_i45.StartProcessingOrderUseCase>(),
        get<_i61.CompleteProcessingOrderUseCase>(),
      ));
  gh.lazySingleton<_i92.PaymentMethodInpBloc>(
      () => _i92.PaymentMethodInpBloc(get<_i75.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i93.ProductBatchInputBloc>(
      () => _i93.ProductBatchInputBloc(get<_i78.GetProductDetailUseCase>()));
  gh.lazySingleton<_i94.ProductCateInputBloc>(() => _i94.ProductCateInputBloc(
        get<_i77.GetProductCatesUseCase>(),
        get<_i76.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i95.ProductDetailBloc>(
      () => _i95.ProductDetailBloc(get<_i78.GetProductDetailUseCase>()));
  gh.lazySingleton<_i96.ProductInventoryBloc>(
      () => _i96.ProductInventoryBloc(get<_i79.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i97.ProductInventoryInputBloc>(
    () => _i97.ProductInventoryInputBloc(
      get<_i80.GetProductsUseCase>(),
      get<_i66.CreateWarehouseInputUseCase>(),
      get<_i63.CreateProductBatchesUseCase>(),
      get<_i86.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i98.ProductPropertiesInputBloc>(() =>
      _i98.ProductPropertiesInputBloc(
          get<_i81.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i99.RegisterShopUseCase>(
      () => _i99.RegisterShopUseCase(get<_i40.ShopRepo>()));
  gh.lazySingleton<_i100.SaveMyAddressUseCase>(
      () => _i100.SaveMyAddressUseCase(get<_i55.AddressRepo>()));
  gh.lazySingleton<_i101.SearchProductsBloc>(() => _i101.SearchProductsBloc(
        get<_i38.SearchProductsUserCase>(),
        get<_i80.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i102.ShopBloc>(
      () => _i102.ShopBloc(get<_i99.RegisterShopUseCase>()));
  gh.lazySingleton<_i103.ShopOrderBloc>(
      () => _i103.ShopOrderBloc(get<_i74.GetOrdersUseCase>()));
  gh.lazySingleton<_i104.ShopProductBloc>(() => _i104.ShopProductBloc(
        get<_i80.GetProductsUseCase>(),
        get<_i77.GetProductCatesUseCase>(),
        get<_i71.GetHomeBannersUseCase>(),
        get<_i68.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i105.ShopProductDetailBloc>(
    () => _i105.ShopProductDetailBloc(
      get<_i78.GetProductDetailUseCase>(),
      get<_i65.CreateProductUseCase>(),
      get<_i64.CreateProductImagesUseCase>(),
      get<_i46.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i106.ShoppingCartBloc>(() => _i106.ShoppingCartBloc(
        get<_i84.GetShoppingCartUseCase>(),
        get<_i47.UpsertCartItemUseCase>(),
        get<_i67.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i107.UserBloc>(
      () => _i107.UserBloc(get<_i85.GetUserDetailUseCase>()));
  gh.factory<_i108.AddressBloc>(() => _i108.AddressBloc(
        get<_i72.GetMyAddressesUseCase>(),
        get<_i82.GetProvincesAndCitiesUseCase>(),
        get<_i70.GetDistrictsUseCase>(),
        get<_i69.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i109.AddressInputBloc>(
      () => _i109.AddressInputBloc(get<_i100.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i110.AuthRepo>(
      () => _i111.AuthRepoImpl(get<_i60.AuthRepoteDatasource>()));
  gh.lazySingleton<_i112.EmailLoginUseCase>(() => _i112.EmailLoginUseCase(
        get<_i110.AuthRepo>(),
        get<_i13.Storage>(),
      ));
  gh.lazySingleton<_i113.QrBarcodeLoginUseCase>(
      () => _i113.QrBarcodeLoginUseCase(
            get<_i110.AuthRepo>(),
            get<_i112.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i114.SignUpUseCase>(
      () => _i114.SignUpUseCase(get<_i110.AuthRepo>()));
  gh.lazySingleton<_i115.LoginBloc>(() => _i115.LoginBloc(
        get<_i112.EmailLoginUseCase>(),
        get<_i113.QrBarcodeLoginUseCase>(),
        get<_i15.CheckLoginUseCase>(),
        get<_i19.LogoutUseCase>(),
        get<_i17.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i116.SignUpBloc>(
      () => _i116.SignUpBloc(get<_i114.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i117.AppModuleDepedenciesProvider {}

class _$NotificationDatasourceProvider
    extends _i22.NotificationDatasourceProvider {}

class _$OrderDatasourceProvider extends _i25.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i28.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i32.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i35.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i39.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i42.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i48.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i51.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i54.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i57.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i60.AuthRepoteDatasourceProvider {}
