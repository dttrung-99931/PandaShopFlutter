// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i17;
import '../../../core/interceptors/pagination_interceptor.dart' as _i6;
import '../../../core/utils/storage.dart' as _i16;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i65;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i117;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i116;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i18;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i20;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i118;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i23;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i119;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i120;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i121;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i122;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i59;
import '../../features/common/data/data_sources/user_data_source.dart' as _i53;
import '../../features/common/data/repos/address_repo_impl.dart' as _i61;
import '../../features/common/data/repos/user_repo_impl.dart' as _i55;
import '../../features/common/domain/repos/address_repo.dart' as _i60;
import '../../features/common/domain/repos/user_repo.dart' as _i54;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i74;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i75;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i77;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i88;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i106;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i91;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i34;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i7;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i114;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i115;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i24;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i4;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i113;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i93;
import '../../features/notification/data/data_sources/notification_data_source.dart'
    as _i25;
import '../../features/notification/data/repos/notification_repo_impl.dart'
    as _i27;
import '../../features/notification/domain/repos/notification_repo.dart'
    as _i26;
import '../../features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i78;
import '../../features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i79;
import '../../features/notification/domain/use_cases/push_notification_usecase.dart'
    as _i13;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i95;
import '../../features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i41;
import '../../features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i12;
import '../../features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i49;
import '../../features/order/data/data_sources/order_data_source.dart' as _i28;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i31;
import '../../features/order/data/repos/order_repo_impl.dart' as _i30;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i33;
import '../../features/order/domain/repos/order_repo.dart' as _i29;
import '../../features/order/domain/repos/payment_repo.dart' as _i32;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i67;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i80;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i81;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i96;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i5;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i98;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i62;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i35;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i38;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i64;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i37;
import '../../features/product/data/repos/product_repo_impl.dart' as _i40;
import '../../features/product/domain/repos/ads_repo.dart' as _i63;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i36;
import '../../features/product/domain/repos/product_repo.dart' as _i39;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i87;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i76;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i69;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i70;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i73;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i82;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i83;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i84;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i86;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i42;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i51;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i101;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i9;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i10;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i107;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i43;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i56;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i45;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i58;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i44;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i57;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i21;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i22;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i68;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i71;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i85;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i92;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i105;
import '../../features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i66;
import '../../features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i50;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i100;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i102;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i99;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i103;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i11;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i104;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i108;
import '../../features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i97;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i109;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i14;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i110;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i111;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i15;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i46;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i48;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i47;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i72;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i89;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i90;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i52;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i112;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i94;
import 'injection.dart' as _i123; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.PaginationInterceptor>(
      () => _i6.PaginationInterceptor());
  gh.lazySingleton<_i7.PickLocalImageUseCase>(
      () => _i7.PickLocalImageUseCase());
  gh.lazySingleton<_i8.ProductInventoryInputCommunication>(
      () => _i8.ProductInventoryInputCommunication());
  gh.lazySingleton<_i9.ProductOptionBloc>(() => _i9.ProductOptionBloc());
  gh.lazySingleton<_i10.ProductOptionCommunication>(
      () => _i10.ProductOptionCommunication());
  gh.lazySingleton<_i11.ProductOptionsInputBloc>(
      () => _i11.ProductOptionsInputBloc());
  gh.lazySingleton<_i12.PushNotificationCommunication>(
      () => _i12.PushNotificationCommunication());
  gh.lazySingleton<_i13.PushNotificationUseCases>(
      () => _i13.PushNotificationUseCases());
  gh.lazySingleton<_i14.ShopProductCommunication>(
      () => _i14.ShopProductCommunication());
  gh.lazySingleton<_i15.ShopProductDetailCommunication>(
      () => _i15.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i16.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i17.ApiInterceptor>(
      () => _i17.ApiInterceptor(get<_i16.Storage>()));
  gh.lazySingleton<_i18.CheckLoginUseCase>(
      () => _i18.CheckLoginUseCase(get<_i16.Storage>()));
  gh.singleton<_i19.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i17.ApiInterceptor>()));
  gh.lazySingleton<_i20.GetRememberLoginEmailUserCase>(
      () => _i20.GetRememberLoginEmailUserCase(get<_i16.Storage>()));
  gh.lazySingleton<_i21.GetRememberLoginEmailUserCase>(
      () => _i21.GetRememberLoginEmailUserCase(get<_i16.Storage>()));
  gh.lazySingleton<_i22.LogoutUseCase>(
      () => _i22.LogoutUseCase(get<_i16.Storage>()));
  gh.lazySingleton<_i23.LogoutUseCase>(
      () => _i23.LogoutUseCase(get<_i16.Storage>()));
  gh.lazySingleton<_i24.MainBloc>(() => _i24.MainBloc(get<_i16.Storage>()));
  gh.singleton<_i25.NotificationDatasource>(notificationDatasourceProvider
      .provideNotificationDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i26.NotificationRepo>(
      () => _i27.NotificationRepoImpl(get<_i25.NotificationDatasource>()));
  gh.singleton<_i28.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i29.OrderRepo>(
      () => _i30.OrderRepoImpl(get<_i28.OrderDatasource>()));
  gh.singleton<_i31.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i32.PaymentRepo>(
      () => _i33.PaymentRepoImpl(get<_i31.PaymentDatasource>()));
  gh.lazySingleton<_i34.PickLocalImageAsBase64UseCase>(() =>
      _i34.PickLocalImageAsBase64UseCase(get<_i7.PickLocalImageUseCase>()));
  gh.singleton<_i35.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i36.ProductCateRepo>(
      () => _i37.ProductRepoImpl(get<_i35.ProductCateDatasource>()));
  gh.singleton<_i38.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i39.ProductRepo>(
      () => _i40.ProductRepoImpl(get<_i38.ProductRemoteDatasource>()));
  gh.lazySingleton<_i41.PushNotificationBloc>(
      () => _i41.PushNotificationBloc(get<_i13.PushNotificationUseCases>()));
  gh.lazySingleton<_i42.SearchProductsUserCase>(
      () => _i42.SearchProductsUserCase(get<_i39.ProductRepo>()));
  gh.singleton<_i43.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i44.ShopRepo>(
      () => _i45.ShopRepoImpl(get<_i43.ShopRemoteDatasource>()));
  gh.singleton<_i46.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i47.ShoppingCartRepo>(
      () => _i48.ShoppingCartRepoImpl(get<_i46.ShoppingCartDatasource>()));
  gh.lazySingleton<_i49.SignalRBloc>(
      () => _i49.SignalRBloc(get<_i16.Storage>()));
  gh.lazySingleton<_i50.StartProcessingOrderUseCase>(
      () => _i50.StartProcessingOrderUseCase(get<_i29.OrderRepo>()));
  gh.lazySingleton<_i51.UpdateProductUseCase>(
      () => _i51.UpdateProductUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i52.UpsertCartItemUseCase>(
      () => _i52.UpsertCartItemUseCase(get<_i47.ShoppingCartRepo>()));
  gh.singleton<_i53.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i54.UserRepo>(
      () => _i55.UserRepoImpl(get<_i53.UserDatasource>()));
  gh.singleton<_i56.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i57.WarehouseRepo>(
      () => _i58.WarehouseRepoImpl(get<_i56.WarehouseRemoteDatasource>()));
  gh.singleton<_i59.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i60.AddressRepo>(
      () => _i61.AddressRepoImpl(get<_i59.AddressDatasource>()));
  gh.singleton<_i62.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i63.AdsRepo>(
      () => _i64.AdsRepoImpl(get<_i62.AdsDatasource>()));
  gh.singleton<_i65.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i19.Dio>()));
  gh.lazySingleton<_i66.CompleteProcessingOrderUseCase>(
      () => _i66.CompleteProcessingOrderUseCase(get<_i29.OrderRepo>()));
  gh.lazySingleton<_i67.CreateOrderUseCase>(
      () => _i67.CreateOrderUseCase(get<_i29.OrderRepo>()));
  gh.lazySingleton<_i68.CreateProductBatchesUseCase>(
      () => _i68.CreateProductBatchesUseCase(get<_i57.WarehouseRepo>()));
  gh.lazySingleton<_i69.CreateProductImagesUseCase>(
      () => _i69.CreateProductImagesUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i70.CreateProductUseCase>(
      () => _i70.CreateProductUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i71.CreateWarehouseInputUseCase>(
      () => _i71.CreateWarehouseInputUseCase(get<_i57.WarehouseRepo>()));
  gh.lazySingleton<_i72.DeleteCartItemsUseCase>(
      () => _i72.DeleteCartItemsUseCase(get<_i47.ShoppingCartRepo>()));
  gh.lazySingleton<_i73.DeleteProductUseCase>(
      () => _i73.DeleteProductUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i74.GetCommunesAndWardsUseCase>(
      () => _i74.GetCommunesAndWardsUseCase(get<_i60.AddressRepo>()));
  gh.lazySingleton<_i75.GetDistrictsUseCase>(
      () => _i75.GetDistrictsUseCase(get<_i60.AddressRepo>()));
  gh.lazySingleton<_i76.GetHomeBannersUseCase>(
      () => _i76.GetHomeBannersUseCase(get<_i63.AdsRepo>()));
  gh.lazySingleton<_i77.GetMyAddressesUseCase>(
      () => _i77.GetMyAddressesUseCase(get<_i60.AddressRepo>()));
  gh.lazySingleton<_i78.GetNotificationOverviewUseCase>(
      () => _i78.GetNotificationOverviewUseCase(get<_i26.NotificationRepo>()));
  gh.lazySingleton<_i79.GetNotificationsUseCase>(
      () => _i79.GetNotificationsUseCase(get<_i26.NotificationRepo>()));
  gh.lazySingleton<_i80.GetOrdersUseCase>(
      () => _i80.GetOrdersUseCase(get<_i29.OrderRepo>()));
  gh.lazySingleton<_i81.GetPaymentMethodsUseCase>(
      () => _i81.GetPaymentMethodsUseCase(get<_i32.PaymentRepo>()));
  gh.lazySingleton<_i82.GetProductCateByIdUseCase>(
      () => _i82.GetProductCateByIdUseCase(get<_i36.ProductCateRepo>()));
  gh.lazySingleton<_i83.GetProductCatesUseCase>(
      () => _i83.GetProductCatesUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i84.GetProductDetailUseCase>(
      () => _i84.GetProductDetailUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i85.GetProductInventoryUseCase>(
      () => _i85.GetProductInventoryUseCase(get<_i57.WarehouseRepo>()));
  gh.lazySingleton<_i86.GetProductsUseCase>(
      () => _i86.GetProductsUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i87.GetPropertyTemplateOfCateUseCase>(
      () => _i87.GetPropertyTemplateOfCateUseCase(get<_i39.ProductRepo>()));
  gh.lazySingleton<_i88.GetProvincesAndCitiesUseCase>(
      () => _i88.GetProvincesAndCitiesUseCase(get<_i60.AddressRepo>()));
  gh.lazySingleton<_i89.GetShoppingCartByIdUseCase>(
      () => _i89.GetShoppingCartByIdUseCase(get<_i47.ShoppingCartRepo>()));
  gh.lazySingleton<_i90.GetShoppingCartUseCase>(
      () => _i90.GetShoppingCartUseCase(get<_i47.ShoppingCartRepo>()));
  gh.lazySingleton<_i91.GetUserDetailUseCase>(
      () => _i91.GetUserDetailUseCase(get<_i54.UserRepo>()));
  gh.lazySingleton<_i92.GetWarehousesUseCase>(
      () => _i92.GetWarehousesUseCase(get<_i57.WarehouseRepo>()));
  gh.lazySingleton<_i93.HomeBloc>(() => _i93.HomeBloc(
        get<_i86.GetProductsUseCase>(),
        get<_i83.GetProductCatesUseCase>(),
        get<_i76.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i94.ImageInputBloc>(
      () => _i94.ImageInputBloc(get<_i34.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i95.NotificationBloc>(() => _i95.NotificationBloc(
        get<_i79.GetNotificationsUseCase>(),
        get<_i78.GetNotificationOverviewUseCase>(),
      ));
  gh.lazySingleton<_i96.OrderBloc>(
    () => _i96.OrderBloc(get<_i67.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i97.OrderProcessBloc>(() => _i97.OrderProcessBloc(
        get<_i50.StartProcessingOrderUseCase>(),
        get<_i66.CompleteProcessingOrderUseCase>(),
      ));
  gh.lazySingleton<_i98.PaymentMethodInpBloc>(
      () => _i98.PaymentMethodInpBloc(get<_i81.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i99.ProductBatchInputBloc>(
      () => _i99.ProductBatchInputBloc(get<_i84.GetProductDetailUseCase>()));
  gh.lazySingleton<_i100.ProductCateInputBloc>(() => _i100.ProductCateInputBloc(
        get<_i83.GetProductCatesUseCase>(),
        get<_i82.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i101.ProductDetailBloc>(
      () => _i101.ProductDetailBloc(get<_i84.GetProductDetailUseCase>()));
  gh.lazySingleton<_i102.ProductInventoryBloc>(
      () => _i102.ProductInventoryBloc(get<_i85.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i103.ProductInventoryInputBloc>(
    () => _i103.ProductInventoryInputBloc(
      get<_i86.GetProductsUseCase>(),
      get<_i71.CreateWarehouseInputUseCase>(),
      get<_i68.CreateProductBatchesUseCase>(),
      get<_i92.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i104.ProductPropertiesInputBloc>(() =>
      _i104.ProductPropertiesInputBloc(
          get<_i87.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i105.RegisterShopUseCase>(
      () => _i105.RegisterShopUseCase(get<_i44.ShopRepo>()));
  gh.lazySingleton<_i106.SaveMyAddressUseCase>(
      () => _i106.SaveMyAddressUseCase(get<_i60.AddressRepo>()));
  gh.lazySingleton<_i107.SearchProductsBloc>(() => _i107.SearchProductsBloc(
        get<_i42.SearchProductsUserCase>(),
        get<_i86.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i108.ShopBloc>(
      () => _i108.ShopBloc(get<_i105.RegisterShopUseCase>()));
  gh.lazySingleton<_i109.ShopOrderBloc>(
      () => _i109.ShopOrderBloc(get<_i80.GetOrdersUseCase>()));
  gh.lazySingleton<_i110.ShopProductBloc>(() => _i110.ShopProductBloc(
        get<_i86.GetProductsUseCase>(),
        get<_i83.GetProductCatesUseCase>(),
        get<_i76.GetHomeBannersUseCase>(),
        get<_i73.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i111.ShopProductDetailBloc>(
    () => _i111.ShopProductDetailBloc(
      get<_i84.GetProductDetailUseCase>(),
      get<_i70.CreateProductUseCase>(),
      get<_i69.CreateProductImagesUseCase>(),
      get<_i51.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i112.ShoppingCartBloc>(() => _i112.ShoppingCartBloc(
        get<_i90.GetShoppingCartUseCase>(),
        get<_i52.UpsertCartItemUseCase>(),
        get<_i72.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i113.UserBloc>(
      () => _i113.UserBloc(get<_i91.GetUserDetailUseCase>()));
  gh.factory<_i114.AddressBloc>(() => _i114.AddressBloc(
        get<_i77.GetMyAddressesUseCase>(),
        get<_i88.GetProvincesAndCitiesUseCase>(),
        get<_i75.GetDistrictsUseCase>(),
        get<_i74.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i115.AddressInputBloc>(
      () => _i115.AddressInputBloc(get<_i106.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i116.AuthRepo>(
      () => _i117.AuthRepoImpl(get<_i65.AuthRepoteDatasource>()));
  gh.lazySingleton<_i118.EmailLoginUseCase>(() => _i118.EmailLoginUseCase(
        get<_i116.AuthRepo>(),
        get<_i16.Storage>(),
      ));
  gh.lazySingleton<_i119.QrBarcodeLoginUseCase>(
      () => _i119.QrBarcodeLoginUseCase(
            get<_i116.AuthRepo>(),
            get<_i118.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i120.SignUpUseCase>(
      () => _i120.SignUpUseCase(get<_i116.AuthRepo>()));
  gh.lazySingleton<_i121.LoginBloc>(() => _i121.LoginBloc(
        get<_i118.EmailLoginUseCase>(),
        get<_i119.QrBarcodeLoginUseCase>(),
        get<_i18.CheckLoginUseCase>(),
        get<_i23.LogoutUseCase>(),
        get<_i20.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i122.SignUpBloc>(
      () => _i122.SignUpBloc(get<_i120.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i123.AppModuleDepedenciesProvider {}

class _$NotificationDatasourceProvider
    extends _i25.NotificationDatasourceProvider {}

class _$OrderDatasourceProvider extends _i28.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i31.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i35.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i38.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i43.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i46.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i53.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i56.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i59.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i62.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i65.AuthRepoteDatasourceProvider {}
