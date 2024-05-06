// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i18;
import '../../../core/interceptors/pagination_interceptor.dart' as _i7;
import '../../../core/utils/storage.dart' as _i17;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i66;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i120;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i119;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i21;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i121;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i23;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i122;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i123;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i124;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i125;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i60;
import '../../features/common/data/data_sources/user_data_source.dart' as _i54;
import '../../features/common/data/repos/address_repo_impl.dart' as _i62;
import '../../features/common/data/repos/user_repo_impl.dart' as _i56;
import '../../features/common/domain/repos/address_repo.dart' as _i61;
import '../../features/common/domain/repos/user_repo.dart' as _i55;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i77;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i78;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i80;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i91;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i109;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i94;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i35;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i8;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i117;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i118;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i25;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i5;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i116;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i96;
import '../../features/notification/data/data_sources/notification_data_source.dart'
    as _i26;
import '../../features/notification/data/repos/notification_repo_impl.dart'
    as _i28;
import '../../features/notification/domain/repos/notification_repo.dart'
    as _i27;
import '../../features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i68;
import '../../features/notification/domain/use_cases/fcm_notification_usecases.dart'
    as _i4;
import '../../features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i81;
import '../../features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i82;
import '../../features/notification/domain/use_cases/push_notification_usecases.dart'
    as _i14;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i98;
import '../../features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i76;
import '../../features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i42;
import '../../features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i13;
import '../../features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i50;
import '../../features/order/data/data_sources/order_data_source.dart' as _i29;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i32;
import '../../features/order/data/repos/order_repo_impl.dart' as _i31;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i34;
import '../../features/order/domain/repos/order_repo.dart' as _i30;
import '../../features/order/domain/repos/payment_repo.dart' as _i33;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i69;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i83;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i84;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i99;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i6;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i101;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i63;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i36;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i39;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i65;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i38;
import '../../features/product/data/repos/product_repo_impl.dart' as _i41;
import '../../features/product/domain/repos/ads_repo.dart' as _i64;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i37;
import '../../features/product/domain/repos/product_repo.dart' as _i40;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i90;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i79;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i71;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i75;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i85;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i86;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i87;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i89;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i43;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i52;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i104;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i10;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i11;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i110;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i44;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i57;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i46;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i59;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i45;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i58;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i22;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i24;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i70;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i73;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i88;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i95;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i108;
import '../../features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i67;
import '../../features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i51;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i103;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i105;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i102;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i106;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i9;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i12;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i107;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i111;
import '../../features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i100;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i112;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i15;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i113;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i114;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i16;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i47;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i49;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i48;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i74;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i92;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i93;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i53;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i115;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i97;
import 'injection.dart' as _i126; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.FCMNotificationsUseCases>(
      () => _i4.FCMNotificationsUseCases());
  gh.lazySingleton<_i5.MainCommunication>(() => _i5.MainCommunication());
  gh.lazySingleton<_i6.OrderBlocCommunication>(
      () => _i6.OrderBlocCommunication());
  gh.lazySingleton<_i7.PaginationInterceptor>(
      () => _i7.PaginationInterceptor());
  gh.lazySingleton<_i8.PickLocalImageUseCase>(
      () => _i8.PickLocalImageUseCase());
  gh.lazySingleton<_i9.ProductInventoryInputCommunication>(
      () => _i9.ProductInventoryInputCommunication());
  gh.lazySingleton<_i10.ProductOptionBloc>(() => _i10.ProductOptionBloc());
  gh.lazySingleton<_i11.ProductOptionCommunication>(
      () => _i11.ProductOptionCommunication());
  gh.lazySingleton<_i12.ProductOptionsInputBloc>(
      () => _i12.ProductOptionsInputBloc());
  gh.lazySingleton<_i13.PushNotificationCommunication>(
      () => _i13.PushNotificationCommunication());
  gh.lazySingleton<_i14.PushNotificationUseCases>(
      () => _i14.PushNotificationUseCases());
  gh.lazySingleton<_i15.ShopProductCommunication>(
      () => _i15.ShopProductCommunication());
  gh.lazySingleton<_i16.ShopProductDetailCommunication>(
      () => _i16.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i17.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i18.ApiInterceptor>(
      () => _i18.ApiInterceptor(get<_i17.Storage>()));
  gh.lazySingleton<_i19.CheckLoginUseCase>(
      () => _i19.CheckLoginUseCase(get<_i17.Storage>()));
  gh.singleton<_i20.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i18.ApiInterceptor>()));
  gh.lazySingleton<_i21.GetRememberLoginEmailUserCase>(
      () => _i21.GetRememberLoginEmailUserCase(get<_i17.Storage>()));
  gh.lazySingleton<_i22.GetRememberLoginEmailUserCase>(
      () => _i22.GetRememberLoginEmailUserCase(get<_i17.Storage>()));
  gh.lazySingleton<_i23.LogoutUseCase>(
      () => _i23.LogoutUseCase(get<_i17.Storage>()));
  gh.lazySingleton<_i24.LogoutUseCase>(
      () => _i24.LogoutUseCase(get<_i17.Storage>()));
  gh.lazySingleton<_i25.MainBloc>(() => _i25.MainBloc(get<_i17.Storage>()));
  gh.singleton<_i26.NotificationDatasource>(notificationDatasourceProvider
      .provideNotificationDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i27.NotificationRepo>(
      () => _i28.NotificationRepoImpl(get<_i26.NotificationDatasource>()));
  gh.singleton<_i29.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i30.OrderRepo>(
      () => _i31.OrderRepoImpl(get<_i29.OrderDatasource>()));
  gh.singleton<_i32.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i33.PaymentRepo>(
      () => _i34.PaymentRepoImpl(get<_i32.PaymentDatasource>()));
  gh.lazySingleton<_i35.PickLocalImageAsBase64UseCase>(() =>
      _i35.PickLocalImageAsBase64UseCase(get<_i8.PickLocalImageUseCase>()));
  gh.singleton<_i36.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i37.ProductCateRepo>(
      () => _i38.ProductRepoImpl(get<_i36.ProductCateDatasource>()));
  gh.singleton<_i39.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i40.ProductRepo>(
      () => _i41.ProductRepoImpl(get<_i39.ProductRemoteDatasource>()));
  gh.lazySingleton<_i42.PushNotificationBloc>(
      () => _i42.PushNotificationBloc(get<_i14.PushNotificationUseCases>()));
  gh.lazySingleton<_i43.SearchProductsUserCase>(
      () => _i43.SearchProductsUserCase(get<_i40.ProductRepo>()));
  gh.singleton<_i44.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i45.ShopRepo>(
      () => _i46.ShopRepoImpl(get<_i44.ShopRemoteDatasource>()));
  gh.singleton<_i47.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i48.ShoppingCartRepo>(
      () => _i49.ShoppingCartRepoImpl(get<_i47.ShoppingCartDatasource>()));
  gh.lazySingleton<_i50.SignalRBloc>(
      () => _i50.SignalRBloc(get<_i17.Storage>()));
  gh.lazySingleton<_i51.StartProcessingOrderUseCase>(
      () => _i51.StartProcessingOrderUseCase(get<_i30.OrderRepo>()));
  gh.lazySingleton<_i52.UpdateProductUseCase>(
      () => _i52.UpdateProductUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i53.UpsertCartItemUseCase>(
      () => _i53.UpsertCartItemUseCase(get<_i48.ShoppingCartRepo>()));
  gh.singleton<_i54.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i55.UserRepo>(
      () => _i56.UserRepoImpl(get<_i54.UserDatasource>()));
  gh.singleton<_i57.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i58.WarehouseRepo>(
      () => _i59.WarehouseRepoImpl(get<_i57.WarehouseRemoteDatasource>()));
  gh.singleton<_i60.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i61.AddressRepo>(
      () => _i62.AddressRepoImpl(get<_i60.AddressDatasource>()));
  gh.singleton<_i63.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i64.AdsRepo>(
      () => _i65.AdsRepoImpl(get<_i63.AdsDatasource>()));
  gh.singleton<_i66.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i67.CompleteProcessingOrderUseCase>(
      () => _i67.CompleteProcessingOrderUseCase(get<_i30.OrderRepo>()));
  gh.lazySingleton<_i68.CreateNotificationReceiverUseCase>(() =>
      _i68.CreateNotificationReceiverUseCase(get<_i27.NotificationRepo>()));
  gh.lazySingleton<_i69.CreateOrderUseCase>(
      () => _i69.CreateOrderUseCase(get<_i30.OrderRepo>()));
  gh.lazySingleton<_i70.CreateProductBatchesUseCase>(
      () => _i70.CreateProductBatchesUseCase(get<_i58.WarehouseRepo>()));
  gh.lazySingleton<_i71.CreateProductImagesUseCase>(
      () => _i71.CreateProductImagesUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i72.CreateProductUseCase>(
      () => _i72.CreateProductUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i73.CreateWarehouseInputUseCase>(
      () => _i73.CreateWarehouseInputUseCase(get<_i58.WarehouseRepo>()));
  gh.lazySingleton<_i74.DeleteCartItemsUseCase>(
      () => _i74.DeleteCartItemsUseCase(get<_i48.ShoppingCartRepo>()));
  gh.lazySingleton<_i75.DeleteProductUseCase>(
      () => _i75.DeleteProductUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i76.FCMBloc>(() => _i76.FCMBloc(
        get<_i68.CreateNotificationReceiverUseCase>(),
        get<_i4.FCMNotificationsUseCases>(),
      ));
  gh.lazySingleton<_i77.GetCommunesAndWardsUseCase>(
      () => _i77.GetCommunesAndWardsUseCase(get<_i61.AddressRepo>()));
  gh.lazySingleton<_i78.GetDistrictsUseCase>(
      () => _i78.GetDistrictsUseCase(get<_i61.AddressRepo>()));
  gh.lazySingleton<_i79.GetHomeBannersUseCase>(
      () => _i79.GetHomeBannersUseCase(get<_i64.AdsRepo>()));
  gh.lazySingleton<_i80.GetMyAddressesUseCase>(
      () => _i80.GetMyAddressesUseCase(get<_i61.AddressRepo>()));
  gh.lazySingleton<_i81.GetNotificationOverviewUseCase>(
      () => _i81.GetNotificationOverviewUseCase(get<_i27.NotificationRepo>()));
  gh.lazySingleton<_i82.GetNotificationsUseCase>(
      () => _i82.GetNotificationsUseCase(get<_i27.NotificationRepo>()));
  gh.lazySingleton<_i83.GetOrdersUseCase>(
      () => _i83.GetOrdersUseCase(get<_i30.OrderRepo>()));
  gh.lazySingleton<_i84.GetPaymentMethodsUseCase>(
      () => _i84.GetPaymentMethodsUseCase(get<_i33.PaymentRepo>()));
  gh.lazySingleton<_i85.GetProductCateByIdUseCase>(
      () => _i85.GetProductCateByIdUseCase(get<_i37.ProductCateRepo>()));
  gh.lazySingleton<_i86.GetProductCatesUseCase>(
      () => _i86.GetProductCatesUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i87.GetProductDetailUseCase>(
      () => _i87.GetProductDetailUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i88.GetProductInventoryUseCase>(
      () => _i88.GetProductInventoryUseCase(get<_i58.WarehouseRepo>()));
  gh.lazySingleton<_i89.GetProductsUseCase>(
      () => _i89.GetProductsUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i90.GetPropertyTemplateOfCateUseCase>(
      () => _i90.GetPropertyTemplateOfCateUseCase(get<_i40.ProductRepo>()));
  gh.lazySingleton<_i91.GetProvincesAndCitiesUseCase>(
      () => _i91.GetProvincesAndCitiesUseCase(get<_i61.AddressRepo>()));
  gh.lazySingleton<_i92.GetShoppingCartByIdUseCase>(
      () => _i92.GetShoppingCartByIdUseCase(get<_i48.ShoppingCartRepo>()));
  gh.lazySingleton<_i93.GetShoppingCartUseCase>(
      () => _i93.GetShoppingCartUseCase(get<_i48.ShoppingCartRepo>()));
  gh.lazySingleton<_i94.GetUserDetailUseCase>(
      () => _i94.GetUserDetailUseCase(get<_i55.UserRepo>()));
  gh.lazySingleton<_i95.GetWarehousesUseCase>(
      () => _i95.GetWarehousesUseCase(get<_i58.WarehouseRepo>()));
  gh.lazySingleton<_i96.HomeBloc>(() => _i96.HomeBloc(
        get<_i89.GetProductsUseCase>(),
        get<_i86.GetProductCatesUseCase>(),
        get<_i79.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i97.ImageInputBloc>(
      () => _i97.ImageInputBloc(get<_i35.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i98.NotificationBloc>(() => _i98.NotificationBloc(
        get<_i82.GetNotificationsUseCase>(),
        get<_i81.GetNotificationOverviewUseCase>(),
      ));
  gh.lazySingleton<_i99.OrderBloc>(
    () => _i99.OrderBloc(get<_i69.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i100.OrderProcessBloc>(() => _i100.OrderProcessBloc(
        get<_i51.StartProcessingOrderUseCase>(),
        get<_i67.CompleteProcessingOrderUseCase>(),
      ));
  gh.lazySingleton<_i101.PaymentMethodInpBloc>(
      () => _i101.PaymentMethodInpBloc(get<_i84.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i102.ProductBatchInputBloc>(
      () => _i102.ProductBatchInputBloc(get<_i87.GetProductDetailUseCase>()));
  gh.lazySingleton<_i103.ProductCateInputBloc>(() => _i103.ProductCateInputBloc(
        get<_i86.GetProductCatesUseCase>(),
        get<_i85.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i104.ProductDetailBloc>(
      () => _i104.ProductDetailBloc(get<_i87.GetProductDetailUseCase>()));
  gh.lazySingleton<_i105.ProductInventoryBloc>(
      () => _i105.ProductInventoryBloc(get<_i88.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i106.ProductInventoryInputBloc>(
    () => _i106.ProductInventoryInputBloc(
      get<_i89.GetProductsUseCase>(),
      get<_i73.CreateWarehouseInputUseCase>(),
      get<_i70.CreateProductBatchesUseCase>(),
      get<_i95.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i107.ProductPropertiesInputBloc>(() =>
      _i107.ProductPropertiesInputBloc(
          get<_i90.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i108.RegisterShopUseCase>(
      () => _i108.RegisterShopUseCase(get<_i45.ShopRepo>()));
  gh.lazySingleton<_i109.SaveMyAddressUseCase>(
      () => _i109.SaveMyAddressUseCase(get<_i61.AddressRepo>()));
  gh.lazySingleton<_i110.SearchProductsBloc>(() => _i110.SearchProductsBloc(
        get<_i43.SearchProductsUserCase>(),
        get<_i89.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i111.ShopBloc>(
      () => _i111.ShopBloc(get<_i108.RegisterShopUseCase>()));
  gh.lazySingleton<_i112.ShopOrderBloc>(
      () => _i112.ShopOrderBloc(get<_i83.GetOrdersUseCase>()));
  gh.lazySingleton<_i113.ShopProductBloc>(() => _i113.ShopProductBloc(
        get<_i89.GetProductsUseCase>(),
        get<_i86.GetProductCatesUseCase>(),
        get<_i79.GetHomeBannersUseCase>(),
        get<_i75.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i114.ShopProductDetailBloc>(
    () => _i114.ShopProductDetailBloc(
      get<_i87.GetProductDetailUseCase>(),
      get<_i72.CreateProductUseCase>(),
      get<_i71.CreateProductImagesUseCase>(),
      get<_i52.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i115.ShoppingCartBloc>(() => _i115.ShoppingCartBloc(
        get<_i93.GetShoppingCartUseCase>(),
        get<_i53.UpsertCartItemUseCase>(),
        get<_i74.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i116.UserBloc>(
      () => _i116.UserBloc(get<_i94.GetUserDetailUseCase>()));
  gh.factory<_i117.AddressBloc>(() => _i117.AddressBloc(
        get<_i80.GetMyAddressesUseCase>(),
        get<_i91.GetProvincesAndCitiesUseCase>(),
        get<_i78.GetDistrictsUseCase>(),
        get<_i77.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i118.AddressInputBloc>(
      () => _i118.AddressInputBloc(get<_i109.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i119.AuthRepo>(
      () => _i120.AuthRepoImpl(get<_i66.AuthRepoteDatasource>()));
  gh.lazySingleton<_i121.EmailLoginUseCase>(() => _i121.EmailLoginUseCase(
        get<_i119.AuthRepo>(),
        get<_i17.Storage>(),
      ));
  gh.lazySingleton<_i122.QrBarcodeLoginUseCase>(
      () => _i122.QrBarcodeLoginUseCase(
            get<_i119.AuthRepo>(),
            get<_i121.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i123.SignUpUseCase>(
      () => _i123.SignUpUseCase(get<_i119.AuthRepo>()));
  gh.lazySingleton<_i124.LoginBloc>(() => _i124.LoginBloc(
        get<_i121.EmailLoginUseCase>(),
        get<_i122.QrBarcodeLoginUseCase>(),
        get<_i19.CheckLoginUseCase>(),
        get<_i23.LogoutUseCase>(),
        get<_i21.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i125.SignUpBloc>(
      () => _i125.SignUpBloc(get<_i123.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i126.AppModuleDepedenciesProvider {}

class _$NotificationDatasourceProvider
    extends _i26.NotificationDatasourceProvider {}

class _$OrderDatasourceProvider extends _i29.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i32.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i36.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i39.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i44.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i47.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i54.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i57.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i60.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i63.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i66.AuthRepoteDatasourceProvider {}
