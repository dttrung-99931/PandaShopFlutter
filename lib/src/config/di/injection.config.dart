// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i39;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i3;
import 'package:evievm_app/core/cache/panda_cache_provider.dart' as _i38;
import 'package:evievm_app/core/interceptors/api_log_interceptor.dart' as _i5;
import 'package:evievm_app/core/interceptors/auth_interceptor.dart' as _i29;
import 'package:evievm_app/core/interceptors/pagination_interceptor.dart'
    as _i4;
import 'package:evievm_app/core/utils/storage.dart' as _i6;
import 'package:evievm_app/src/config/di/injection.dart' as _i140;
import 'package:evievm_app/src/features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i42;
import 'package:evievm_app/src/features/auth/data/repositories/auth_repo_impl.dart'
    as _i53;
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart'
    as _i52;
import 'package:evievm_app/src/features/auth/domain/use_cases/check_login_usecase.dart'
    as _i31;
import 'package:evievm_app/src/features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i32;
import 'package:evievm_app/src/features/auth/domain/use_cases/login_usecase.dart'
    as _i63;
import 'package:evievm_app/src/features/auth/domain/use_cases/logout_usecase.dart'
    as _i30;
import 'package:evievm_app/src/features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i68;
import 'package:evievm_app/src/features/auth/domain/use_cases/sign_up_usecase.dart'
    as _i64;
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart'
    as _i92;
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i122;
import 'package:evievm_app/src/features/common/data/data_sources/address_data_soruce.dart'
    as _i49;
import 'package:evievm_app/src/features/common/data/data_sources/user_data_source.dart'
    as _i50;
import 'package:evievm_app/src/features/common/data/repos/address_repo_impl.dart'
    as _i57;
import 'package:evievm_app/src/features/common/data/repos/user_repo_impl.dart'
    as _i96;
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart'
    as _i56;
import 'package:evievm_app/src/features/common/domain/repos/user_repo.dart'
    as _i95;
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i62;
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i60;
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart'
    as _i21;
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i59;
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i58;
import 'package:evievm_app/src/features/common/domain/use_cases/map/map_tracking_usecase.dart'
    as _i20;
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i61;
import 'package:evievm_app/src/features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i119;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/edit_image_use_case.dart'
    as _i19;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i28;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i25;
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart'
    as _i67;
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i97;
import 'package:evievm_app/src/features/common/presentation/bloc/map_address/map_address_bloc.dart'
    as _i22;
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_bloc.dart'
    as _i27;
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_communicaton.dart'
    as _i23;
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart'
    as _i138;
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i98;
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc.dart'
    as _i36;
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc_communicaton.dart'
    as _i24;
import 'package:evievm_app/src/features/notification/data/data_sources/notification_data_source.dart'
    as _i43;
import 'package:evievm_app/src/features/notification/data/repos/notification_repo_impl.dart'
    as _i55;
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart'
    as _i54;
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i71;
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart'
    as _i10;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i73;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i72;
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart'
    as _i9;
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart'
    as _i134;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i100;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i26;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i11;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i33;
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart'
    as _i41;
import 'package:evievm_app/src/features/order/data/data_sources/payment_data_soruce.dart'
    as _i40;
import 'package:evievm_app/src/features/order/data/repos/order_repo_impl.dart'
    as _i102;
import 'package:evievm_app/src/features/order/data/repos/payment_repo_impl.dart'
    as _i76;
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart'
    as _i101;
import 'package:evievm_app/src/features/order/domain/repos/payment_repo.dart'
    as _i75;
import 'package:evievm_app/src/features/order/domain/use_cases/create_order_usecase.dart'
    as _i111;
import 'package:evievm_app/src/features/order/domain/use_cases/get_complete_processing_orders_usecase.dart'
    as _i113;
import 'package:evievm_app/src/features/order/domain/use_cases/get_delivering_orders_usecase.dart'
    as _i109;
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart'
    as _i108;
import 'package:evievm_app/src/features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i131;
import 'package:evievm_app/src/features/order/domain/use_cases/get_waiting_delivery_orders_usecase.dart'
    as _i110;
import 'package:evievm_app/src/features/order/domain/use_cases/request_partner_delivery_usecase.dart'
    as _i112;
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i7;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart'
    as _i133;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i8;
import 'package:evievm_app/src/features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i139;
import 'package:evievm_app/src/features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i46;
import 'package:evievm_app/src/features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i47;
import 'package:evievm_app/src/features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i48;
import 'package:evievm_app/src/features/product/data/repos/ads_repo_impl.dart'
    as _i70;
import 'package:evievm_app/src/features/product/data/repos/product_repo_cate_impl.dart'
    as _i94;
import 'package:evievm_app/src/features/product/data/repos/product_repo_impl.dart'
    as _i78;
import 'package:evievm_app/src/features/product/domain/repos/ads_repo.dart'
    as _i69;
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart'
    as _i93;
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart'
    as _i77;
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i87;
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i74;
import 'package:evievm_app/src/features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i86;
import 'package:evievm_app/src/features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i79;
import 'package:evievm_app/src/features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i81;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i132;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i83;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i85;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i84;
import 'package:evievm_app/src/features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i82;
import 'package:evievm_app/src/features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i80;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i99;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i18;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i17;
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i121;
import 'package:evievm_app/src/features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i44;
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart'
    as _i45;
import 'package:evievm_app/src/features/shop/data/repositories/shop_repo_impl.dart'
    as _i66;
import 'package:evievm_app/src/features/shop/data/repositories/warehouse_repo_impl.dart'
    as _i91;
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart'
    as _i65;
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart'
    as _i90;
import 'package:evievm_app/src/features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i35;
import 'package:evievm_app/src/features/shop/domain/use_cases/logout_usecase.dart'
    as _i34;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i106;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i105;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i103;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i104;
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i117;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i115;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i114;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i137;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i123;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i116;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i124;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i12;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i15;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i129;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart'
    as _i118;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i136;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i130;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc_communication.dart'
    as _i16;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i14;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i107;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i120;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i13;
import 'package:evievm_app/src/features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i51;
import 'package:evievm_app/src/features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i89;
import 'package:evievm_app/src/features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i88;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i126;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i127;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i128;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i125;
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i135;
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart'
    as _i37;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final cacheProvider = _$CacheProvider();
    final appModuleDepedenciesProvider = _$AppModuleDepedenciesProvider();
    final paymentDatasourceProvider = _$PaymentDatasourceProvider();
    final orderDatasourceProvider = _$OrderDatasourceProvider();
    final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
    final notificationDatasourceProvider = _$NotificationDatasourceProvider();
    final shopRepoteDatasourceProvider = _$ShopRepoteDatasourceProvider();
    final warehouseRemoteDatasourceProvider =
        _$WarehouseRemoteDatasourceProvider();
    final adsDatasourceProvider = _$AdsDatasourceProvider();
    final productCateDatasourceProvider = _$ProductCateDatasourceProvider();
    final productRemoteDatasourceProvider = _$ProductRemoteDatasourceProvider();
    final addressDatasourceProvider = _$AddressDatasourceProvider();
    final userDatasourceProvider = _$UserDatasourceProvider();
    final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
    gh.singleton<_i3.CacheStore>(() => cacheProvider.provideCacheStore());
    gh.lazySingleton<_i4.PaginationInterceptor>(
        () => _i4.PaginationInterceptor());
    gh.lazySingleton<_i5.ApiLogInterceptor>(() => _i5.ApiLogInterceptor());
    await gh.lazySingletonAsync<_i6.Storage>(
      () => appModuleDepedenciesProvider.provideStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.DeliveryMethodInpBloc>(
        () => _i7.DeliveryMethodInpBloc());
    gh.lazySingleton<_i8.OrderBlocCommunication>(
        () => _i8.OrderBlocCommunication());
    gh.lazySingleton<_i9.PushNotificationUseCases>(
        () => _i9.PushNotificationUseCases());
    gh.lazySingleton<_i10.FCMNotificationsUseCases>(
        () => _i10.FCMNotificationsUseCases());
    gh.lazySingleton<_i11.PushNotificationCommunication>(
        () => _i11.PushNotificationCommunication());
    gh.lazySingleton<_i12.ProductInventoryInputCommunication>(
        () => _i12.ProductInventoryInputCommunication());
    gh.lazySingleton<_i13.ShopProductDetailCommunication>(
        () => _i13.ShopProductDetailCommunication());
    gh.lazySingleton<_i14.ShopProductCommunication>(
        () => _i14.ShopProductCommunication());
    gh.lazySingleton<_i15.ProductOptionsInputBloc>(
        () => _i15.ProductOptionsInputBloc());
    gh.lazySingleton<_i16.ShopOrderBlocCommunication>(
        () => _i16.ShopOrderBlocCommunication());
    gh.lazySingleton<_i17.ProductOptionCommunication>(
        () => _i17.ProductOptionCommunication());
    gh.lazySingleton<_i18.ProductOptionBloc>(() => _i18.ProductOptionBloc());
    gh.lazySingleton<_i19.EditImageUseCase>(() => _i19.EditImageUseCase());
    gh.lazySingleton<_i20.MapTrackingUsecase>(() => _i20.MapTrackingUsecase());
    gh.lazySingleton<_i21.GetMapPlaceDetailUseCase>(
        () => _i21.GetMapPlaceDetailUseCase());
    gh.lazySingleton<_i22.MapAddressBloc>(() => _i22.MapAddressBloc());
    gh.lazySingleton<_i23.MapDeliveryTrackingCommunication>(
        () => _i23.MapDeliveryTrackingCommunication());
    gh.lazySingleton<_i24.MainCommunication>(() => _i24.MainCommunication());
    gh.lazySingleton<_i25.PickLocalImageUseCase>(
        () => _i25.PickLocalImageUseCase(gh<_i19.EditImageUseCase>()));
    gh.lazySingleton<_i26.PushNotificationBloc>(
        () => _i26.PushNotificationBloc(gh<_i9.PushNotificationUseCases>()));
    gh.lazySingleton<_i27.MapDeliveryTrackingBloc>(
        () => _i27.MapDeliveryTrackingBloc(gh<_i20.MapTrackingUsecase>()));
    gh.singleton<_i3.CacheOptions>(
        () => cacheProvider.provideBaseCacheOptions(gh<_i3.CacheStore>()));
    gh.lazySingleton<_i28.PickLocalImageCompressedBase64UseCase>(() =>
        _i28.PickLocalImageCompressedBase64UseCase(
            gh<_i25.PickLocalImageUseCase>()));
    gh.lazySingleton<_i29.AuthInterceptor>(
        () => _i29.AuthInterceptor(gh<_i6.Storage>()));
    gh.lazySingleton<_i30.LogoutUseCase>(
        () => _i30.LogoutUseCase(gh<_i6.Storage>()));
    gh.lazySingleton<_i31.CheckLoginUseCase>(
        () => _i31.CheckLoginUseCase(gh<_i6.Storage>()));
    gh.lazySingleton<_i32.GetRememberLoginEmailUserCase>(
        () => _i32.GetRememberLoginEmailUserCase(gh<_i6.Storage>()));
    gh.lazySingleton<_i33.SignalRBloc>(
        () => _i33.SignalRBloc(gh<_i6.Storage>()));
    gh.lazySingleton<_i34.LogoutUseCase>(
        () => _i34.LogoutUseCase(gh<_i6.Storage>()));
    gh.lazySingleton<_i35.GetRememberLoginEmailUserCase>(
        () => _i35.GetRememberLoginEmailUserCase(gh<_i6.Storage>()));
    gh.lazySingleton<_i36.MainBloc>(() => _i36.MainBloc(gh<_i6.Storage>()));
    gh.lazySingleton<_i37.ImageInputBloc>(
      () =>
          _i37.ImageInputBloc(gh<_i28.PickLocalImageCompressedBase64UseCase>()),
      dispose: (i) => i.onClose(),
    );
    gh.singleton<_i38.CacheMaxStaleModifierInterceptor>(() => cacheProvider
        .provideCacheMaxStaleModifierInterceptor(gh<_i3.CacheOptions>()));
    gh.singleton<_i3.DioCacheInterceptor>(
        () => cacheProvider.provideDioCacheInterceptor(gh<_i3.CacheOptions>()));
    gh.singleton<_i39.Dio>(() => appModuleDepedenciesProvider.provideNetworkDio(
          gh<_i29.AuthInterceptor>(),
          gh<_i5.ApiLogInterceptor>(),
          gh<_i38.CacheMaxStaleModifierInterceptor>(),
          gh<_i3.DioCacheInterceptor>(),
        ));
    gh.singleton<_i40.PaymentDatasource>(() =>
        paymentDatasourceProvider.providePaymentDatasource(gh<_i39.Dio>()));
    gh.singleton<_i41.OrderDatasource>(
        () => orderDatasourceProvider.provideOrderDatasource(gh<_i39.Dio>()));
    gh.singleton<_i42.AuthRepoteDatasource>(() => authRepoteDatasourceProvider
        .provideAuthRepoteDatasource(gh<_i39.Dio>()));
    gh.singleton<_i43.NotificationDatasource>(() =>
        notificationDatasourceProvider
            .provideNotificationDatasource(gh<_i39.Dio>()));
    gh.singleton<_i44.ShopRemoteDatasource>(() => shopRepoteDatasourceProvider
        .provideShopRepoteDatasource(gh<_i39.Dio>()));
    gh.singleton<_i45.WarehouseRemoteDatasource>(() =>
        warehouseRemoteDatasourceProvider
            .provideWarehouseRemoteDatasource(gh<_i39.Dio>()));
    gh.singleton<_i46.AdsDatasource>(
        () => adsDatasourceProvider.provideAdsDatasource(gh<_i39.Dio>()));
    gh.singleton<_i47.ProductCateDatasource>(() => productCateDatasourceProvider
        .provideProductCateDatasource(gh<_i39.Dio>()));
    gh.singleton<_i48.ProductRemoteDatasource>(() =>
        productRemoteDatasourceProvider
            .provideProductRemoteDatasource(gh<_i39.Dio>()));
    gh.singleton<_i49.AddressDatasource>(() =>
        addressDatasourceProvider.provideAddressDatasource(gh<_i39.Dio>()));
    gh.singleton<_i50.UserDatasource>(
        () => userDatasourceProvider.provideUserDatasource(gh<_i39.Dio>()));
    gh.singleton<_i51.ShoppingCartDatasource>(() =>
        shoppingCartDatasourceProvider
            .provideShoppingCartDatasource(gh<_i39.Dio>()));
    gh.lazySingleton<_i52.AuthRepo>(
        () => _i53.AuthRepoImpl(gh<_i42.AuthRepoteDatasource>()));
    gh.lazySingleton<_i54.NotificationRepo>(
        () => _i55.NotificationRepoImpl(gh<_i43.NotificationDatasource>()));
    gh.lazySingleton<_i56.AddressRepo>(
        () => _i57.AddressRepoImpl(gh<_i49.AddressDatasource>()));
    gh.lazySingleton<_i58.GetProvincesAndCitiesUseCase>(
        () => _i58.GetProvincesAndCitiesUseCase(gh<_i56.AddressRepo>()));
    gh.lazySingleton<_i59.GetMyAddressesUseCase>(
        () => _i59.GetMyAddressesUseCase(gh<_i56.AddressRepo>()));
    gh.lazySingleton<_i60.GetDistrictsUseCase>(
        () => _i60.GetDistrictsUseCase(gh<_i56.AddressRepo>()));
    gh.lazySingleton<_i61.SaveMyAddressUseCase>(
        () => _i61.SaveMyAddressUseCase(gh<_i56.AddressRepo>()));
    gh.lazySingleton<_i62.GetCommunesAndWardsUseCase>(
        () => _i62.GetCommunesAndWardsUseCase(gh<_i56.AddressRepo>()));
    gh.lazySingleton<_i63.EmailLoginUseCase>(() => _i63.EmailLoginUseCase(
          gh<_i52.AuthRepo>(),
          gh<_i6.Storage>(),
        ));
    gh.lazySingleton<_i64.SignUpUseCase>(
        () => _i64.SignUpUseCase(gh<_i52.AuthRepo>()));
    gh.lazySingleton<_i65.ShopRepo>(
        () => _i66.ShopRepoImpl(gh<_i44.ShopRemoteDatasource>()));
    gh.factory<_i67.AddressBloc>(() => _i67.AddressBloc(
          gh<_i59.GetMyAddressesUseCase>(),
          gh<_i58.GetProvincesAndCitiesUseCase>(),
          gh<_i60.GetDistrictsUseCase>(),
          gh<_i62.GetCommunesAndWardsUseCase>(),
        ));
    gh.lazySingleton<_i68.QrBarcodeLoginUseCase>(
        () => _i68.QrBarcodeLoginUseCase(
              gh<_i52.AuthRepo>(),
              gh<_i63.EmailLoginUseCase>(),
            ));
    gh.lazySingleton<_i69.AdsRepo>(
        () => _i70.AdsRepoImpl(gh<_i46.AdsDatasource>()));
    gh.lazySingleton<_i71.CreateNotificationReceiverUseCase>(() =>
        _i71.CreateNotificationReceiverUseCase(gh<_i54.NotificationRepo>()));
    gh.lazySingleton<_i72.GetNotificationsUseCase>(
        () => _i72.GetNotificationsUseCase(gh<_i54.NotificationRepo>()));
    gh.lazySingleton<_i73.GetNotificationOverviewUseCase>(
        () => _i73.GetNotificationOverviewUseCase(gh<_i54.NotificationRepo>()));
    gh.lazySingleton<_i74.GetHomeBannersUseCase>(
        () => _i74.GetHomeBannersUseCase(gh<_i69.AdsRepo>()));
    gh.lazySingleton<_i75.PaymentRepo>(
        () => _i76.PaymentRepoImpl(gh<_i40.PaymentDatasource>()));
    gh.lazySingleton<_i77.ProductRepo>(
        () => _i78.ProductRepoImpl(gh<_i48.ProductRemoteDatasource>()));
    gh.lazySingleton<_i79.CreateProductUseCase>(
        () => _i79.CreateProductUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i80.UpdateProductUseCase>(
        () => _i80.UpdateProductUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i81.DeleteProductUseCase>(
        () => _i81.DeleteProductUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i82.SearchProductsUserCase>(
        () => _i82.SearchProductsUserCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i83.GetProductCatesUseCase>(
        () => _i83.GetProductCatesUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i84.GetProductsUseCase>(
        () => _i84.GetProductsUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i85.GetProductDetailUseCase>(
        () => _i85.GetProductDetailUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i86.CreateProductImagesUseCase>(
        () => _i86.CreateProductImagesUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i87.GetPropertyTemplateOfCateUseCase>(
        () => _i87.GetPropertyTemplateOfCateUseCase(gh<_i77.ProductRepo>()));
    gh.lazySingleton<_i88.ShoppingCartRepo>(
        () => _i89.ShoppingCartRepoImpl(gh<_i51.ShoppingCartDatasource>()));
    gh.lazySingleton<_i90.WarehouseRepo>(
        () => _i91.WarehouseRepoImpl(gh<_i45.WarehouseRemoteDatasource>()));
    gh.lazySingleton<_i92.LoginBloc>(() => _i92.LoginBloc(
          gh<_i63.EmailLoginUseCase>(),
          gh<_i68.QrBarcodeLoginUseCase>(),
          gh<_i31.CheckLoginUseCase>(),
          gh<_i30.LogoutUseCase>(),
          gh<_i32.GetRememberLoginEmailUserCase>(),
        ));
    gh.lazySingleton<_i93.ProductCateRepo>(
        () => _i94.ProductRepoImpl(gh<_i47.ProductCateDatasource>()));
    gh.lazySingleton<_i95.UserRepo>(
        () => _i96.UserRepoImpl(gh<_i50.UserDatasource>()));
    gh.lazySingleton<_i97.AddressInputBloc>(
        () => _i97.AddressInputBloc(gh<_i61.SaveMyAddressUseCase>()));
    gh.lazySingleton<_i98.HomeBloc>(() => _i98.HomeBloc(
          gh<_i84.GetProductsUseCase>(),
          gh<_i83.GetProductCatesUseCase>(),
          gh<_i74.GetHomeBannersUseCase>(),
        ));
    gh.lazySingleton<_i99.ProductDetailBloc>(
        () => _i99.ProductDetailBloc(gh<_i85.GetProductDetailUseCase>()));
    gh.lazySingleton<_i100.FCMBloc>(() => _i100.FCMBloc(
          gh<_i71.CreateNotificationReceiverUseCase>(),
          gh<_i10.FCMNotificationsUseCases>(),
        ));
    gh.lazySingleton<_i101.OrderRepo>(
        () => _i102.OrderRepoImpl(gh<_i41.OrderDatasource>()));
    gh.lazySingleton<_i103.GetProductInventoryUseCase>(
        () => _i103.GetProductInventoryUseCase(gh<_i90.WarehouseRepo>()));
    gh.lazySingleton<_i104.GetWarehousesUseCase>(
        () => _i104.GetWarehousesUseCase(gh<_i90.WarehouseRepo>()));
    gh.lazySingleton<_i105.CreateWarehouseInputUseCase>(
        () => _i105.CreateWarehouseInputUseCase(gh<_i90.WarehouseRepo>()));
    gh.lazySingleton<_i106.CreateProductBatchesUseCase>(
        () => _i106.CreateProductBatchesUseCase(gh<_i90.WarehouseRepo>()));
    gh.lazySingleton<_i107.ShopProductBloc>(() => _i107.ShopProductBloc(
          gh<_i84.GetProductsUseCase>(),
          gh<_i83.GetProductCatesUseCase>(),
          gh<_i74.GetHomeBannersUseCase>(),
          gh<_i81.DeleteProductUseCase>(),
        ));
    gh.lazySingleton<_i108.GetOrdersUseCase>(
        () => _i108.GetOrdersUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i109.GetDeliveringOrdersUseCase>(
        () => _i109.GetDeliveringOrdersUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i110.GetWaitingDeliveryOrdersUseCase>(
        () => _i110.GetWaitingDeliveryOrdersUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i111.CreateOrderUseCase>(
        () => _i111.CreateOrderUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i112.RequestPartnerDeliveryUsecase>(
        () => _i112.RequestPartnerDeliveryUsecase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i113.GetCompleteProcessingOrdersUseCase>(
        () => _i113.GetCompleteProcessingOrdersUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i114.StartProcessingOrderUseCase>(
        () => _i114.StartProcessingOrderUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i115.CompleteProcessingOrderUseCase>(
        () => _i115.CompleteProcessingOrderUseCase(gh<_i101.OrderRepo>()));
    gh.lazySingleton<_i116.ProductBatchInputBloc>(
        () => _i116.ProductBatchInputBloc(gh<_i85.GetProductDetailUseCase>()));
    gh.lazySingleton<_i117.RegisterShopUseCase>(
        () => _i117.RegisterShopUseCase(gh<_i65.ShopRepo>()));
    gh.lazySingleton<_i118.ShopBloc>(
        () => _i118.ShopBloc(gh<_i117.RegisterShopUseCase>()));
    gh.lazySingleton<_i119.GetUserDetailUseCase>(
        () => _i119.GetUserDetailUseCase(gh<_i95.UserRepo>()));
    gh.lazySingleton<_i120.ShopProductDetailBloc>(
      () => _i120.ShopProductDetailBloc(
        gh<_i85.GetProductDetailUseCase>(),
        gh<_i79.CreateProductUseCase>(),
        gh<_i86.CreateProductImagesUseCase>(),
        gh<_i80.UpdateProductUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i121.SearchProductsBloc>(() => _i121.SearchProductsBloc(
          gh<_i82.SearchProductsUserCase>(),
          gh<_i84.GetProductsUseCase>(),
        ));
    gh.lazySingleton<_i122.SignUpBloc>(
        () => _i122.SignUpBloc(gh<_i64.SignUpUseCase>()));
    gh.lazySingleton<_i123.ProductInventoryBloc>(() =>
        _i123.ProductInventoryBloc(gh<_i103.GetProductInventoryUseCase>()));
    gh.lazySingleton<_i124.ProductInventoryInputBloc>(
      () => _i124.ProductInventoryInputBloc(
        gh<_i84.GetProductsUseCase>(),
        gh<_i105.CreateWarehouseInputUseCase>(),
        gh<_i106.CreateProductBatchesUseCase>(),
        gh<_i104.GetWarehousesUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i125.UpsertCartItemUseCase>(
        () => _i125.UpsertCartItemUseCase(gh<_i88.ShoppingCartRepo>()));
    gh.lazySingleton<_i126.DeleteCartItemsUseCase>(
        () => _i126.DeleteCartItemsUseCase(gh<_i88.ShoppingCartRepo>()));
    gh.lazySingleton<_i127.GetShoppingCartByIdUseCase>(
        () => _i127.GetShoppingCartByIdUseCase(gh<_i88.ShoppingCartRepo>()));
    gh.lazySingleton<_i128.GetShoppingCartUseCase>(
        () => _i128.GetShoppingCartUseCase(gh<_i88.ShoppingCartRepo>()));
    gh.lazySingleton<_i129.ProductPropertiesInputBloc>(() =>
        _i129.ProductPropertiesInputBloc(
            gh<_i87.GetPropertyTemplateOfCateUseCase>()));
    gh.lazySingleton<_i130.ShopOrderBloc>(() => _i130.ShopOrderBloc(
          gh<_i108.GetOrdersUseCase>(),
          gh<_i113.GetCompleteProcessingOrdersUseCase>(),
          gh<_i110.GetWaitingDeliveryOrdersUseCase>(),
          gh<_i109.GetDeliveringOrdersUseCase>(),
        ));
    gh.lazySingleton<_i131.GetPaymentMethodsUseCase>(
        () => _i131.GetPaymentMethodsUseCase(gh<_i75.PaymentRepo>()));
    gh.lazySingleton<_i132.GetProductCateByIdUseCase>(
        () => _i132.GetProductCateByIdUseCase(gh<_i93.ProductCateRepo>()));
    gh.lazySingleton<_i133.OrderBloc>(
      () => _i133.OrderBloc(gh<_i111.CreateOrderUseCase>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i134.NotificationBloc>(() => _i134.NotificationBloc(
          gh<_i72.GetNotificationsUseCase>(),
          gh<_i73.GetNotificationOverviewUseCase>(),
        ));
    gh.lazySingleton<_i135.ShoppingCartBloc>(() => _i135.ShoppingCartBloc(
          gh<_i128.GetShoppingCartUseCase>(),
          gh<_i125.UpsertCartItemUseCase>(),
          gh<_i126.DeleteCartItemsUseCase>(),
        ));
    gh.lazySingleton<_i136.OrderProcessBloc>(() => _i136.OrderProcessBloc(
          gh<_i114.StartProcessingOrderUseCase>(),
          gh<_i115.CompleteProcessingOrderUseCase>(),
          gh<_i112.RequestPartnerDeliveryUsecase>(),
        ));
    gh.lazySingleton<_i137.ProductCateInputBloc>(
        () => _i137.ProductCateInputBloc(
              gh<_i83.GetProductCatesUseCase>(),
              gh<_i132.GetProductCateByIdUseCase>(),
            ));
    gh.lazySingleton<_i138.UserBloc>(
        () => _i138.UserBloc(gh<_i119.GetUserDetailUseCase>()));
    gh.lazySingleton<_i139.PaymentMethodInpBloc>(
        () => _i139.PaymentMethodInpBloc(gh<_i131.GetPaymentMethodsUseCase>()));
    return this;
  }
}

class _$CacheProvider extends _i38.CacheProvider {}

class _$AppModuleDepedenciesProvider
    extends _i140.AppModuleDepedenciesProvider {}

class _$PaymentDatasourceProvider extends _i40.PaymentDatasourceProvider {}

class _$OrderDatasourceProvider extends _i41.OrderDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i42.AuthRepoteDatasourceProvider {}

class _$NotificationDatasourceProvider
    extends _i43.NotificationDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i44.ShopRepoteDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i45.WarehouseRemoteDatasourceProvider {}

class _$AdsDatasourceProvider extends _i46.AdsDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i47.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i48.ProductRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i49.AddressDatasourceProvider {}

class _$UserDatasourceProvider extends _i50.UserDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i51.ShoppingCartDatasourceProvider {}
