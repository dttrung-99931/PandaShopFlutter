// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i19;
import '../../../core/interceptors/pagination_interceptor.dart' as _i8;
import '../../../core/utils/storage.dart' as _i18;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i67;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i121;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i120;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i20;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i22;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i122;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i24;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i123;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i124;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i125;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i126;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i61;
import '../../features/common/data/data_sources/user_data_source.dart' as _i55;
import '../../features/common/data/repos/address_repo_impl.dart' as _i63;
import '../../features/common/data/repos/user_repo_impl.dart' as _i57;
import '../../features/common/domain/repos/address_repo.dart' as _i62;
import '../../features/common/domain/repos/user_repo.dart' as _i56;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i78;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i79;
import '../../features/common/domain/use_cases/get_map_place_detail_usecase.dart'
    as _i5;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i81;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i92;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i110;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i95;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i36;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i9;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i118;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i119;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i26;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i6;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i117;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i97;
import '../../features/notification/data/data_sources/notification_data_source.dart'
    as _i27;
import '../../features/notification/data/repos/notification_repo_impl.dart'
    as _i29;
import '../../features/notification/domain/repos/notification_repo.dart'
    as _i28;
import '../../features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i69;
import '../../features/notification/domain/use_cases/fcm_notification_usecases.dart'
    as _i4;
import '../../features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i82;
import '../../features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i83;
import '../../features/notification/domain/use_cases/push_notification_usecases.dart'
    as _i15;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i99;
import '../../features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i77;
import '../../features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i43;
import '../../features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i14;
import '../../features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i51;
import '../../features/order/data/data_sources/order_data_source.dart' as _i30;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i33;
import '../../features/order/data/repos/order_repo_impl.dart' as _i32;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i35;
import '../../features/order/domain/repos/order_repo.dart' as _i31;
import '../../features/order/domain/repos/payment_repo.dart' as _i34;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i70;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i84;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i85;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i100;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i7;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i102;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i64;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i37;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i40;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i66;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i39;
import '../../features/product/data/repos/product_repo_impl.dart' as _i42;
import '../../features/product/domain/repos/ads_repo.dart' as _i65;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i38;
import '../../features/product/domain/repos/product_repo.dart' as _i41;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i91;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i80;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i73;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i76;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i86;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i87;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i88;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i90;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i44;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i53;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i105;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i11;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i12;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i111;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i45;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i58;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i47;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i60;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i46;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i59;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i23;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i25;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i71;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i74;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i89;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i96;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i109;
import '../../features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i68;
import '../../features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i52;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i104;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i106;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i103;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i107;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i10;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i13;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i108;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i112;
import '../../features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i101;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i113;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i16;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i114;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i115;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i17;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i48;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i50;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i49;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i75;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i93;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i94;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i54;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i116;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i98;
import 'injection.dart' as _i127; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.GetMapPlaceDetailUseCase>(
      () => _i5.GetMapPlaceDetailUseCase());
  gh.lazySingleton<_i6.MainCommunication>(() => _i6.MainCommunication());
  gh.lazySingleton<_i7.OrderBlocCommunication>(
      () => _i7.OrderBlocCommunication());
  gh.lazySingleton<_i8.PaginationInterceptor>(
      () => _i8.PaginationInterceptor());
  gh.lazySingleton<_i9.PickLocalImageUseCase>(
      () => _i9.PickLocalImageUseCase());
  gh.lazySingleton<_i10.ProductInventoryInputCommunication>(
      () => _i10.ProductInventoryInputCommunication());
  gh.lazySingleton<_i11.ProductOptionBloc>(() => _i11.ProductOptionBloc());
  gh.lazySingleton<_i12.ProductOptionCommunication>(
      () => _i12.ProductOptionCommunication());
  gh.lazySingleton<_i13.ProductOptionsInputBloc>(
      () => _i13.ProductOptionsInputBloc());
  gh.lazySingleton<_i14.PushNotificationCommunication>(
      () => _i14.PushNotificationCommunication());
  gh.lazySingleton<_i15.PushNotificationUseCases>(
      () => _i15.PushNotificationUseCases());
  gh.lazySingleton<_i16.ShopProductCommunication>(
      () => _i16.ShopProductCommunication());
  gh.lazySingleton<_i17.ShopProductDetailCommunication>(
      () => _i17.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i18.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i19.ApiInterceptor>(
      () => _i19.ApiInterceptor(get<_i18.Storage>()));
  gh.lazySingleton<_i20.CheckLoginUseCase>(
      () => _i20.CheckLoginUseCase(get<_i18.Storage>()));
  gh.singleton<_i21.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i19.ApiInterceptor>()));
  gh.lazySingleton<_i22.GetRememberLoginEmailUserCase>(
      () => _i22.GetRememberLoginEmailUserCase(get<_i18.Storage>()));
  gh.lazySingleton<_i23.GetRememberLoginEmailUserCase>(
      () => _i23.GetRememberLoginEmailUserCase(get<_i18.Storage>()));
  gh.lazySingleton<_i24.LogoutUseCase>(
      () => _i24.LogoutUseCase(get<_i18.Storage>()));
  gh.lazySingleton<_i25.LogoutUseCase>(
      () => _i25.LogoutUseCase(get<_i18.Storage>()));
  gh.lazySingleton<_i26.MainBloc>(() => _i26.MainBloc(get<_i18.Storage>()));
  gh.singleton<_i27.NotificationDatasource>(notificationDatasourceProvider
      .provideNotificationDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i28.NotificationRepo>(
      () => _i29.NotificationRepoImpl(get<_i27.NotificationDatasource>()));
  gh.singleton<_i30.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i31.OrderRepo>(
      () => _i32.OrderRepoImpl(get<_i30.OrderDatasource>()));
  gh.singleton<_i33.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i34.PaymentRepo>(
      () => _i35.PaymentRepoImpl(get<_i33.PaymentDatasource>()));
  gh.lazySingleton<_i36.PickLocalImageAsBase64UseCase>(() =>
      _i36.PickLocalImageAsBase64UseCase(get<_i9.PickLocalImageUseCase>()));
  gh.singleton<_i37.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i38.ProductCateRepo>(
      () => _i39.ProductRepoImpl(get<_i37.ProductCateDatasource>()));
  gh.singleton<_i40.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i41.ProductRepo>(
      () => _i42.ProductRepoImpl(get<_i40.ProductRemoteDatasource>()));
  gh.lazySingleton<_i43.PushNotificationBloc>(
      () => _i43.PushNotificationBloc(get<_i15.PushNotificationUseCases>()));
  gh.lazySingleton<_i44.SearchProductsUserCase>(
      () => _i44.SearchProductsUserCase(get<_i41.ProductRepo>()));
  gh.singleton<_i45.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i46.ShopRepo>(
      () => _i47.ShopRepoImpl(get<_i45.ShopRemoteDatasource>()));
  gh.singleton<_i48.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i49.ShoppingCartRepo>(
      () => _i50.ShoppingCartRepoImpl(get<_i48.ShoppingCartDatasource>()));
  gh.lazySingleton<_i51.SignalRBloc>(
      () => _i51.SignalRBloc(get<_i18.Storage>()));
  gh.lazySingleton<_i52.StartProcessingOrderUseCase>(
      () => _i52.StartProcessingOrderUseCase(get<_i31.OrderRepo>()));
  gh.lazySingleton<_i53.UpdateProductUseCase>(
      () => _i53.UpdateProductUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i54.UpsertCartItemUseCase>(
      () => _i54.UpsertCartItemUseCase(get<_i49.ShoppingCartRepo>()));
  gh.singleton<_i55.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i56.UserRepo>(
      () => _i57.UserRepoImpl(get<_i55.UserDatasource>()));
  gh.singleton<_i58.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i59.WarehouseRepo>(
      () => _i60.WarehouseRepoImpl(get<_i58.WarehouseRemoteDatasource>()));
  gh.singleton<_i61.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i62.AddressRepo>(
      () => _i63.AddressRepoImpl(get<_i61.AddressDatasource>()));
  gh.singleton<_i64.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i65.AdsRepo>(
      () => _i66.AdsRepoImpl(get<_i64.AdsDatasource>()));
  gh.singleton<_i67.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i21.Dio>()));
  gh.lazySingleton<_i68.CompleteProcessingOrderUseCase>(
      () => _i68.CompleteProcessingOrderUseCase(get<_i31.OrderRepo>()));
  gh.lazySingleton<_i69.CreateNotificationReceiverUseCase>(() =>
      _i69.CreateNotificationReceiverUseCase(get<_i28.NotificationRepo>()));
  gh.lazySingleton<_i70.CreateOrderUseCase>(
      () => _i70.CreateOrderUseCase(get<_i31.OrderRepo>()));
  gh.lazySingleton<_i71.CreateProductBatchesUseCase>(
      () => _i71.CreateProductBatchesUseCase(get<_i59.WarehouseRepo>()));
  gh.lazySingleton<_i72.CreateProductImagesUseCase>(
      () => _i72.CreateProductImagesUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i73.CreateProductUseCase>(
      () => _i73.CreateProductUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i74.CreateWarehouseInputUseCase>(
      () => _i74.CreateWarehouseInputUseCase(get<_i59.WarehouseRepo>()));
  gh.lazySingleton<_i75.DeleteCartItemsUseCase>(
      () => _i75.DeleteCartItemsUseCase(get<_i49.ShoppingCartRepo>()));
  gh.lazySingleton<_i76.DeleteProductUseCase>(
      () => _i76.DeleteProductUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i77.FCMBloc>(() => _i77.FCMBloc(
        get<_i69.CreateNotificationReceiverUseCase>(),
        get<_i4.FCMNotificationsUseCases>(),
      ));
  gh.lazySingleton<_i78.GetCommunesAndWardsUseCase>(
      () => _i78.GetCommunesAndWardsUseCase(get<_i62.AddressRepo>()));
  gh.lazySingleton<_i79.GetDistrictsUseCase>(
      () => _i79.GetDistrictsUseCase(get<_i62.AddressRepo>()));
  gh.lazySingleton<_i80.GetHomeBannersUseCase>(
      () => _i80.GetHomeBannersUseCase(get<_i65.AdsRepo>()));
  gh.lazySingleton<_i81.GetMyAddressesUseCase>(
      () => _i81.GetMyAddressesUseCase(get<_i62.AddressRepo>()));
  gh.lazySingleton<_i82.GetNotificationOverviewUseCase>(
      () => _i82.GetNotificationOverviewUseCase(get<_i28.NotificationRepo>()));
  gh.lazySingleton<_i83.GetNotificationsUseCase>(
      () => _i83.GetNotificationsUseCase(get<_i28.NotificationRepo>()));
  gh.lazySingleton<_i84.GetOrdersUseCase>(
      () => _i84.GetOrdersUseCase(get<_i31.OrderRepo>()));
  gh.lazySingleton<_i85.GetPaymentMethodsUseCase>(
      () => _i85.GetPaymentMethodsUseCase(get<_i34.PaymentRepo>()));
  gh.lazySingleton<_i86.GetProductCateByIdUseCase>(
      () => _i86.GetProductCateByIdUseCase(get<_i38.ProductCateRepo>()));
  gh.lazySingleton<_i87.GetProductCatesUseCase>(
      () => _i87.GetProductCatesUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i88.GetProductDetailUseCase>(
      () => _i88.GetProductDetailUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i89.GetProductInventoryUseCase>(
      () => _i89.GetProductInventoryUseCase(get<_i59.WarehouseRepo>()));
  gh.lazySingleton<_i90.GetProductsUseCase>(
      () => _i90.GetProductsUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i91.GetPropertyTemplateOfCateUseCase>(
      () => _i91.GetPropertyTemplateOfCateUseCase(get<_i41.ProductRepo>()));
  gh.lazySingleton<_i92.GetProvincesAndCitiesUseCase>(
      () => _i92.GetProvincesAndCitiesUseCase(get<_i62.AddressRepo>()));
  gh.lazySingleton<_i93.GetShoppingCartByIdUseCase>(
      () => _i93.GetShoppingCartByIdUseCase(get<_i49.ShoppingCartRepo>()));
  gh.lazySingleton<_i94.GetShoppingCartUseCase>(
      () => _i94.GetShoppingCartUseCase(get<_i49.ShoppingCartRepo>()));
  gh.lazySingleton<_i95.GetUserDetailUseCase>(
      () => _i95.GetUserDetailUseCase(get<_i56.UserRepo>()));
  gh.lazySingleton<_i96.GetWarehousesUseCase>(
      () => _i96.GetWarehousesUseCase(get<_i59.WarehouseRepo>()));
  gh.lazySingleton<_i97.HomeBloc>(() => _i97.HomeBloc(
        get<_i90.GetProductsUseCase>(),
        get<_i87.GetProductCatesUseCase>(),
        get<_i80.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i98.ImageInputBloc>(
      () => _i98.ImageInputBloc(get<_i36.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i99.NotificationBloc>(() => _i99.NotificationBloc(
        get<_i83.GetNotificationsUseCase>(),
        get<_i82.GetNotificationOverviewUseCase>(),
      ));
  gh.lazySingleton<_i100.OrderBloc>(
    () => _i100.OrderBloc(get<_i70.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i101.OrderProcessBloc>(() => _i101.OrderProcessBloc(
        get<_i52.StartProcessingOrderUseCase>(),
        get<_i68.CompleteProcessingOrderUseCase>(),
      ));
  gh.lazySingleton<_i102.PaymentMethodInpBloc>(
      () => _i102.PaymentMethodInpBloc(get<_i85.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i103.ProductBatchInputBloc>(
      () => _i103.ProductBatchInputBloc(get<_i88.GetProductDetailUseCase>()));
  gh.lazySingleton<_i104.ProductCateInputBloc>(() => _i104.ProductCateInputBloc(
        get<_i87.GetProductCatesUseCase>(),
        get<_i86.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i105.ProductDetailBloc>(
      () => _i105.ProductDetailBloc(get<_i88.GetProductDetailUseCase>()));
  gh.lazySingleton<_i106.ProductInventoryBloc>(
      () => _i106.ProductInventoryBloc(get<_i89.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i107.ProductInventoryInputBloc>(
    () => _i107.ProductInventoryInputBloc(
      get<_i90.GetProductsUseCase>(),
      get<_i74.CreateWarehouseInputUseCase>(),
      get<_i71.CreateProductBatchesUseCase>(),
      get<_i96.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i108.ProductPropertiesInputBloc>(() =>
      _i108.ProductPropertiesInputBloc(
          get<_i91.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i109.RegisterShopUseCase>(
      () => _i109.RegisterShopUseCase(get<_i46.ShopRepo>()));
  gh.lazySingleton<_i110.SaveMyAddressUseCase>(
      () => _i110.SaveMyAddressUseCase(get<_i62.AddressRepo>()));
  gh.lazySingleton<_i111.SearchProductsBloc>(() => _i111.SearchProductsBloc(
        get<_i44.SearchProductsUserCase>(),
        get<_i90.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i112.ShopBloc>(
      () => _i112.ShopBloc(get<_i109.RegisterShopUseCase>()));
  gh.lazySingleton<_i113.ShopOrderBloc>(
      () => _i113.ShopOrderBloc(get<_i84.GetOrdersUseCase>()));
  gh.lazySingleton<_i114.ShopProductBloc>(() => _i114.ShopProductBloc(
        get<_i90.GetProductsUseCase>(),
        get<_i87.GetProductCatesUseCase>(),
        get<_i80.GetHomeBannersUseCase>(),
        get<_i76.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i115.ShopProductDetailBloc>(
    () => _i115.ShopProductDetailBloc(
      get<_i88.GetProductDetailUseCase>(),
      get<_i73.CreateProductUseCase>(),
      get<_i72.CreateProductImagesUseCase>(),
      get<_i53.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i116.ShoppingCartBloc>(() => _i116.ShoppingCartBloc(
        get<_i94.GetShoppingCartUseCase>(),
        get<_i54.UpsertCartItemUseCase>(),
        get<_i75.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i117.UserBloc>(
      () => _i117.UserBloc(get<_i95.GetUserDetailUseCase>()));
  gh.factory<_i118.AddressBloc>(() => _i118.AddressBloc(
        get<_i81.GetMyAddressesUseCase>(),
        get<_i92.GetProvincesAndCitiesUseCase>(),
        get<_i79.GetDistrictsUseCase>(),
        get<_i78.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i119.AddressInputBloc>(() => _i119.AddressInputBloc(
        get<_i110.SaveMyAddressUseCase>(),
        get<_i5.GetMapPlaceDetailUseCase>(),
      ));
  gh.lazySingleton<_i120.AuthRepo>(
      () => _i121.AuthRepoImpl(get<_i67.AuthRepoteDatasource>()));
  gh.lazySingleton<_i122.EmailLoginUseCase>(() => _i122.EmailLoginUseCase(
        get<_i120.AuthRepo>(),
        get<_i18.Storage>(),
      ));
  gh.lazySingleton<_i123.QrBarcodeLoginUseCase>(
      () => _i123.QrBarcodeLoginUseCase(
            get<_i120.AuthRepo>(),
            get<_i122.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i124.SignUpUseCase>(
      () => _i124.SignUpUseCase(get<_i120.AuthRepo>()));
  gh.lazySingleton<_i125.LoginBloc>(() => _i125.LoginBloc(
        get<_i122.EmailLoginUseCase>(),
        get<_i123.QrBarcodeLoginUseCase>(),
        get<_i20.CheckLoginUseCase>(),
        get<_i24.LogoutUseCase>(),
        get<_i22.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i126.SignUpBloc>(
      () => _i126.SignUpBloc(get<_i124.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i127.AppModuleDepedenciesProvider {}

class _$NotificationDatasourceProvider
    extends _i27.NotificationDatasourceProvider {}

class _$OrderDatasourceProvider extends _i30.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i33.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i37.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i40.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i45.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i48.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i55.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i58.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i61.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i64.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i67.AuthRepoteDatasourceProvider {}
