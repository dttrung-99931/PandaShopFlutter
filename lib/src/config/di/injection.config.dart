// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i34;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i3;
import 'package:evievm_app/core/cache/panda_cache_provider.dart' as _i33;
import 'package:evievm_app/core/interceptors/api_log_interceptor.dart' as _i21;
import 'package:evievm_app/core/interceptors/auth_interceptor.dart' as _i31;
import 'package:evievm_app/core/interceptors/pagination_interceptor.dart'
    as _i4;
import 'package:evievm_app/core/utils/storage.dart' as _i5;
import 'package:evievm_app/src/config/di/injection.dart' as _i133;
import 'package:evievm_app/src/features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i37;
import 'package:evievm_app/src/features/auth/data/repositories/auth_repo_impl.dart'
    as _i48;
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart'
    as _i47;
import 'package:evievm_app/src/features/auth/domain/use_cases/check_login_usecase.dart'
    as _i25;
import 'package:evievm_app/src/features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i26;
import 'package:evievm_app/src/features/auth/domain/use_cases/login_usecase.dart'
    as _i58;
import 'package:evievm_app/src/features/auth/domain/use_cases/logout_usecase.dart'
    as _i24;
import 'package:evievm_app/src/features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i63;
import 'package:evievm_app/src/features/auth/domain/use_cases/sign_up_usecase.dart'
    as _i59;
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart'
    as _i87;
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i115;
import 'package:evievm_app/src/features/common/data/data_sources/address_data_soruce.dart'
    as _i44;
import 'package:evievm_app/src/features/common/data/data_sources/user_data_source.dart'
    as _i45;
import 'package:evievm_app/src/features/common/data/repos/address_repo_impl.dart'
    as _i52;
import 'package:evievm_app/src/features/common/data/repos/user_repo_impl.dart'
    as _i91;
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart'
    as _i51;
import 'package:evievm_app/src/features/common/domain/repos/user_repo.dart'
    as _i90;
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i57;
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i55;
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart'
    as _i18;
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i54;
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i53;
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i56;
import 'package:evievm_app/src/features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i112;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i23;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i17;
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart'
    as _i62;
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i101;
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart'
    as _i30;
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i20;
import 'package:evievm_app/src/features/common/presentation/bloc/map_address/map_address_bloc.dart'
    as _i19;
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart'
    as _i131;
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i92;
import 'package:evievm_app/src/features/notification/data/data_sources/notification_data_source.dart'
    as _i38;
import 'package:evievm_app/src/features/notification/data/repos/notification_repo_impl.dart'
    as _i50;
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart'
    as _i49;
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i66;
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart'
    as _i9;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i68;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i67;
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart'
    as _i8;
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart'
    as _i127;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i94;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i22;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i10;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i27;
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart'
    as _i36;
import 'package:evievm_app/src/features/order/data/data_sources/payment_data_soruce.dart'
    as _i35;
import 'package:evievm_app/src/features/order/data/repos/order_repo_impl.dart'
    as _i96;
import 'package:evievm_app/src/features/order/data/repos/payment_repo_impl.dart'
    as _i71;
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart'
    as _i95;
import 'package:evievm_app/src/features/order/domain/repos/payment_repo.dart'
    as _i70;
import 'package:evievm_app/src/features/order/domain/use_cases/create_order_usecase.dart'
    as _i104;
import 'package:evievm_app/src/features/order/domain/use_cases/get_complete_processing_orders_usecase.dart'
    as _i107;
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart'
    as _i103;
import 'package:evievm_app/src/features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i123;
import 'package:evievm_app/src/features/order/domain/use_cases/request_partner_delivery_usecase.dart'
    as _i108;
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i6;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart'
    as _i126;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i7;
import 'package:evievm_app/src/features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i132;
import 'package:evievm_app/src/features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i41;
import 'package:evievm_app/src/features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i42;
import 'package:evievm_app/src/features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i43;
import 'package:evievm_app/src/features/product/data/repos/ads_repo_impl.dart'
    as _i65;
import 'package:evievm_app/src/features/product/data/repos/product_repo_cate_impl.dart'
    as _i89;
import 'package:evievm_app/src/features/product/data/repos/product_repo_impl.dart'
    as _i73;
import 'package:evievm_app/src/features/product/domain/repos/ads_repo.dart'
    as _i64;
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart'
    as _i88;
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart'
    as _i72;
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i82;
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i69;
import 'package:evievm_app/src/features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i81;
import 'package:evievm_app/src/features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i74;
import 'package:evievm_app/src/features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i76;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i124;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i78;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i80;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i79;
import 'package:evievm_app/src/features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i77;
import 'package:evievm_app/src/features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i75;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i93;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i16;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i15;
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i114;
import 'package:evievm_app/src/features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i39;
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart'
    as _i40;
import 'package:evievm_app/src/features/shop/data/repositories/shop_repo_impl.dart'
    as _i61;
import 'package:evievm_app/src/features/shop/data/repositories/warehouse_repo_impl.dart'
    as _i86;
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart'
    as _i60;
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart'
    as _i85;
import 'package:evievm_app/src/features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i29;
import 'package:evievm_app/src/features/shop/domain/use_cases/logout_usecase.dart'
    as _i28;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i100;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i99;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i97;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i98;
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i110;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i106;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i105;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i130;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i116;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i109;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i117;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i11;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i14;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i122;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart'
    as _i111;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i129;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i125;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i13;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i102;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i113;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i12;
import 'package:evievm_app/src/features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i46;
import 'package:evievm_app/src/features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i84;
import 'package:evievm_app/src/features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i83;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i119;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i120;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i121;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i118;
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i128;
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart'
    as _i32;
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
    await gh.lazySingletonAsync<_i5.Storage>(
      () => appModuleDepedenciesProvider.provideStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.DeliveryMethodInpBloc>(
        () => _i6.DeliveryMethodInpBloc());
    gh.lazySingleton<_i7.OrderBlocCommunication>(
        () => _i7.OrderBlocCommunication());
    gh.lazySingleton<_i8.PushNotificationUseCases>(
        () => _i8.PushNotificationUseCases());
    gh.lazySingleton<_i9.FCMNotificationsUseCases>(
        () => _i9.FCMNotificationsUseCases());
    gh.lazySingleton<_i10.PushNotificationCommunication>(
        () => _i10.PushNotificationCommunication());
    gh.lazySingleton<_i11.ProductInventoryInputCommunication>(
        () => _i11.ProductInventoryInputCommunication());
    gh.lazySingleton<_i12.ShopProductDetailCommunication>(
        () => _i12.ShopProductDetailCommunication());
    gh.lazySingleton<_i13.ShopProductCommunication>(
        () => _i13.ShopProductCommunication());
    gh.lazySingleton<_i14.ProductOptionsInputBloc>(
        () => _i14.ProductOptionsInputBloc());
    gh.lazySingleton<_i15.ProductOptionCommunication>(
        () => _i15.ProductOptionCommunication());
    gh.lazySingleton<_i16.ProductOptionBloc>(() => _i16.ProductOptionBloc());
    gh.lazySingleton<_i17.PickLocalImageUseCase>(
        () => _i17.PickLocalImageUseCase());
    gh.lazySingleton<_i18.GetMapPlaceDetailUseCase>(
        () => _i18.GetMapPlaceDetailUseCase());
    gh.lazySingleton<_i19.MapAddressBloc>(() => _i19.MapAddressBloc());
    gh.lazySingleton<_i20.MainCommunication>(() => _i20.MainCommunication());
    gh.lazySingleton<_i21.ApiLogInterceptor>(() => _i21.ApiLogInterceptor());
    gh.lazySingleton<_i22.PushNotificationBloc>(
        () => _i22.PushNotificationBloc(gh<_i8.PushNotificationUseCases>()));
    gh.singleton<_i3.CacheOptions>(
        () => cacheProvider.provideBaseCacheOptions(gh<_i3.CacheStore>()));
    gh.lazySingleton<_i23.PickLocalImageCompressedBase64UseCase>(() =>
        _i23.PickLocalImageCompressedBase64UseCase(
            gh<_i17.PickLocalImageUseCase>()));
    gh.lazySingleton<_i24.LogoutUseCase>(
        () => _i24.LogoutUseCase(gh<_i5.Storage>()));
    gh.lazySingleton<_i25.CheckLoginUseCase>(
        () => _i25.CheckLoginUseCase(gh<_i5.Storage>()));
    gh.lazySingleton<_i26.GetRememberLoginEmailUserCase>(
        () => _i26.GetRememberLoginEmailUserCase(gh<_i5.Storage>()));
    gh.lazySingleton<_i27.SignalRBloc>(
        () => _i27.SignalRBloc(gh<_i5.Storage>()));
    gh.lazySingleton<_i28.LogoutUseCase>(
        () => _i28.LogoutUseCase(gh<_i5.Storage>()));
    gh.lazySingleton<_i29.GetRememberLoginEmailUserCase>(
        () => _i29.GetRememberLoginEmailUserCase(gh<_i5.Storage>()));
    gh.lazySingleton<_i30.MainBloc>(() => _i30.MainBloc(gh<_i5.Storage>()));
    gh.lazySingleton<_i31.AuthInterceptor>(
        () => _i31.AuthInterceptor(gh<_i5.Storage>()));
    gh.lazySingleton<_i32.ImageInputBloc>(() =>
        _i32.ImageInputBloc(gh<_i23.PickLocalImageCompressedBase64UseCase>()));
    gh.singleton<_i33.CacheMaxStaleModifierInterceptor>(() => cacheProvider
        .provideCacheMaxStaleModifierInterceptor(gh<_i3.CacheOptions>()));
    gh.singleton<_i3.DioCacheInterceptor>(
        () => cacheProvider.provideDioCacheInterceptor(gh<_i3.CacheOptions>()));
    gh.singleton<_i34.Dio>(() => appModuleDepedenciesProvider.provideNetworkDio(
          gh<_i31.AuthInterceptor>(),
          gh<_i21.ApiLogInterceptor>(),
          gh<_i33.CacheMaxStaleModifierInterceptor>(),
          gh<_i3.DioCacheInterceptor>(),
        ));
    gh.singleton<_i35.PaymentDatasource>(() =>
        paymentDatasourceProvider.providePaymentDatasource(gh<_i34.Dio>()));
    gh.singleton<_i36.OrderDatasource>(
        () => orderDatasourceProvider.provideOrderDatasource(gh<_i34.Dio>()));
    gh.singleton<_i37.AuthRepoteDatasource>(() => authRepoteDatasourceProvider
        .provideAuthRepoteDatasource(gh<_i34.Dio>()));
    gh.singleton<_i38.NotificationDatasource>(() =>
        notificationDatasourceProvider
            .provideNotificationDatasource(gh<_i34.Dio>()));
    gh.singleton<_i39.ShopRemoteDatasource>(() => shopRepoteDatasourceProvider
        .provideShopRepoteDatasource(gh<_i34.Dio>()));
    gh.singleton<_i40.WarehouseRemoteDatasource>(() =>
        warehouseRemoteDatasourceProvider
            .provideWarehouseRemoteDatasource(gh<_i34.Dio>()));
    gh.singleton<_i41.AdsDatasource>(
        () => adsDatasourceProvider.provideAdsDatasource(gh<_i34.Dio>()));
    gh.singleton<_i42.ProductCateDatasource>(() => productCateDatasourceProvider
        .provideProductCateDatasource(gh<_i34.Dio>()));
    gh.singleton<_i43.ProductRemoteDatasource>(() =>
        productRemoteDatasourceProvider
            .provideProductRemoteDatasource(gh<_i34.Dio>()));
    gh.singleton<_i44.AddressDatasource>(() =>
        addressDatasourceProvider.provideAddressDatasource(gh<_i34.Dio>()));
    gh.singleton<_i45.UserDatasource>(
        () => userDatasourceProvider.provideUserDatasource(gh<_i34.Dio>()));
    gh.singleton<_i46.ShoppingCartDatasource>(() =>
        shoppingCartDatasourceProvider
            .provideShoppingCartDatasource(gh<_i34.Dio>()));
    gh.lazySingleton<_i47.AuthRepo>(
        () => _i48.AuthRepoImpl(gh<_i37.AuthRepoteDatasource>()));
    gh.lazySingleton<_i49.NotificationRepo>(
        () => _i50.NotificationRepoImpl(gh<_i38.NotificationDatasource>()));
    gh.lazySingleton<_i51.AddressRepo>(
        () => _i52.AddressRepoImpl(gh<_i44.AddressDatasource>()));
    gh.lazySingleton<_i53.GetProvincesAndCitiesUseCase>(
        () => _i53.GetProvincesAndCitiesUseCase(gh<_i51.AddressRepo>()));
    gh.lazySingleton<_i54.GetMyAddressesUseCase>(
        () => _i54.GetMyAddressesUseCase(gh<_i51.AddressRepo>()));
    gh.lazySingleton<_i55.GetDistrictsUseCase>(
        () => _i55.GetDistrictsUseCase(gh<_i51.AddressRepo>()));
    gh.lazySingleton<_i56.SaveMyAddressUseCase>(
        () => _i56.SaveMyAddressUseCase(gh<_i51.AddressRepo>()));
    gh.lazySingleton<_i57.GetCommunesAndWardsUseCase>(
        () => _i57.GetCommunesAndWardsUseCase(gh<_i51.AddressRepo>()));
    gh.lazySingleton<_i58.EmailLoginUseCase>(() => _i58.EmailLoginUseCase(
          gh<_i47.AuthRepo>(),
          gh<_i5.Storage>(),
        ));
    gh.lazySingleton<_i59.SignUpUseCase>(
        () => _i59.SignUpUseCase(gh<_i47.AuthRepo>()));
    gh.lazySingleton<_i60.ShopRepo>(
        () => _i61.ShopRepoImpl(gh<_i39.ShopRemoteDatasource>()));
    gh.factory<_i62.AddressBloc>(() => _i62.AddressBloc(
          gh<_i54.GetMyAddressesUseCase>(),
          gh<_i53.GetProvincesAndCitiesUseCase>(),
          gh<_i55.GetDistrictsUseCase>(),
          gh<_i57.GetCommunesAndWardsUseCase>(),
        ));
    gh.lazySingleton<_i63.QrBarcodeLoginUseCase>(
        () => _i63.QrBarcodeLoginUseCase(
              gh<_i47.AuthRepo>(),
              gh<_i58.EmailLoginUseCase>(),
            ));
    gh.lazySingleton<_i64.AdsRepo>(
        () => _i65.AdsRepoImpl(gh<_i41.AdsDatasource>()));
    gh.lazySingleton<_i66.CreateNotificationReceiverUseCase>(() =>
        _i66.CreateNotificationReceiverUseCase(gh<_i49.NotificationRepo>()));
    gh.lazySingleton<_i67.GetNotificationsUseCase>(
        () => _i67.GetNotificationsUseCase(gh<_i49.NotificationRepo>()));
    gh.lazySingleton<_i68.GetNotificationOverviewUseCase>(
        () => _i68.GetNotificationOverviewUseCase(gh<_i49.NotificationRepo>()));
    gh.lazySingleton<_i69.GetHomeBannersUseCase>(
        () => _i69.GetHomeBannersUseCase(gh<_i64.AdsRepo>()));
    gh.lazySingleton<_i70.PaymentRepo>(
        () => _i71.PaymentRepoImpl(gh<_i35.PaymentDatasource>()));
    gh.lazySingleton<_i72.ProductRepo>(
        () => _i73.ProductRepoImpl(gh<_i43.ProductRemoteDatasource>()));
    gh.lazySingleton<_i74.CreateProductUseCase>(
        () => _i74.CreateProductUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i75.UpdateProductUseCase>(
        () => _i75.UpdateProductUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i76.DeleteProductUseCase>(
        () => _i76.DeleteProductUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i77.SearchProductsUserCase>(
        () => _i77.SearchProductsUserCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i78.GetProductCatesUseCase>(
        () => _i78.GetProductCatesUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i79.GetProductsUseCase>(
        () => _i79.GetProductsUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i80.GetProductDetailUseCase>(
        () => _i80.GetProductDetailUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i81.CreateProductImagesUseCase>(
        () => _i81.CreateProductImagesUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i82.GetPropertyTemplateOfCateUseCase>(
        () => _i82.GetPropertyTemplateOfCateUseCase(gh<_i72.ProductRepo>()));
    gh.lazySingleton<_i83.ShoppingCartRepo>(
        () => _i84.ShoppingCartRepoImpl(gh<_i46.ShoppingCartDatasource>()));
    gh.lazySingleton<_i85.WarehouseRepo>(
        () => _i86.WarehouseRepoImpl(gh<_i40.WarehouseRemoteDatasource>()));
    gh.lazySingleton<_i87.LoginBloc>(() => _i87.LoginBloc(
          gh<_i58.EmailLoginUseCase>(),
          gh<_i63.QrBarcodeLoginUseCase>(),
          gh<_i25.CheckLoginUseCase>(),
          gh<_i24.LogoutUseCase>(),
          gh<_i26.GetRememberLoginEmailUserCase>(),
        ));
    gh.lazySingleton<_i88.ProductCateRepo>(
        () => _i89.ProductRepoImpl(gh<_i42.ProductCateDatasource>()));
    gh.lazySingleton<_i90.UserRepo>(
        () => _i91.UserRepoImpl(gh<_i45.UserDatasource>()));
    gh.lazySingleton<_i92.HomeBloc>(() => _i92.HomeBloc(
          gh<_i79.GetProductsUseCase>(),
          gh<_i78.GetProductCatesUseCase>(),
          gh<_i69.GetHomeBannersUseCase>(),
        ));
    gh.lazySingleton<_i93.ProductDetailBloc>(
        () => _i93.ProductDetailBloc(gh<_i80.GetProductDetailUseCase>()));
    gh.lazySingleton<_i94.FCMBloc>(() => _i94.FCMBloc(
          gh<_i66.CreateNotificationReceiverUseCase>(),
          gh<_i9.FCMNotificationsUseCases>(),
        ));
    gh.lazySingleton<_i95.OrderRepo>(
        () => _i96.OrderRepoImpl(gh<_i36.OrderDatasource>()));
    gh.lazySingleton<_i97.GetProductInventoryUseCase>(
        () => _i97.GetProductInventoryUseCase(gh<_i85.WarehouseRepo>()));
    gh.lazySingleton<_i98.GetWarehousesUseCase>(
        () => _i98.GetWarehousesUseCase(gh<_i85.WarehouseRepo>()));
    gh.lazySingleton<_i99.CreateWarehouseInputUseCase>(
        () => _i99.CreateWarehouseInputUseCase(gh<_i85.WarehouseRepo>()));
    gh.lazySingleton<_i100.CreateProductBatchesUseCase>(
        () => _i100.CreateProductBatchesUseCase(gh<_i85.WarehouseRepo>()));
    gh.lazySingleton<_i101.AddressInputBloc>(() => _i101.AddressInputBloc(
          gh<_i56.SaveMyAddressUseCase>(),
          gh<_i18.GetMapPlaceDetailUseCase>(),
        ));
    gh.lazySingleton<_i102.ShopProductBloc>(() => _i102.ShopProductBloc(
          gh<_i79.GetProductsUseCase>(),
          gh<_i78.GetProductCatesUseCase>(),
          gh<_i69.GetHomeBannersUseCase>(),
          gh<_i76.DeleteProductUseCase>(),
        ));
    gh.lazySingleton<_i103.GetOrdersUseCase>(
        () => _i103.GetOrdersUseCase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i104.CreateOrderUseCase>(
        () => _i104.CreateOrderUseCase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i105.StartProcessingOrderUseCase>(
        () => _i105.StartProcessingOrderUseCase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i106.CompleteProcessingOrderUseCase>(
        () => _i106.CompleteProcessingOrderUseCase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i107.GetCompleteProcessingOrdersUseCase>(
        () => _i107.GetCompleteProcessingOrdersUseCase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i108.RequestPartnerDeliveryUsecase>(
        () => _i108.RequestPartnerDeliveryUsecase(gh<_i95.OrderRepo>()));
    gh.lazySingleton<_i109.ProductBatchInputBloc>(
        () => _i109.ProductBatchInputBloc(gh<_i80.GetProductDetailUseCase>()));
    gh.lazySingleton<_i110.RegisterShopUseCase>(
        () => _i110.RegisterShopUseCase(gh<_i60.ShopRepo>()));
    gh.lazySingleton<_i111.ShopBloc>(
        () => _i111.ShopBloc(gh<_i110.RegisterShopUseCase>()));
    gh.lazySingleton<_i112.GetUserDetailUseCase>(
        () => _i112.GetUserDetailUseCase(gh<_i90.UserRepo>()));
    gh.lazySingleton<_i113.ShopProductDetailBloc>(
      () => _i113.ShopProductDetailBloc(
        gh<_i80.GetProductDetailUseCase>(),
        gh<_i74.CreateProductUseCase>(),
        gh<_i81.CreateProductImagesUseCase>(),
        gh<_i75.UpdateProductUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i114.SearchProductsBloc>(() => _i114.SearchProductsBloc(
          gh<_i77.SearchProductsUserCase>(),
          gh<_i79.GetProductsUseCase>(),
        ));
    gh.lazySingleton<_i115.SignUpBloc>(
        () => _i115.SignUpBloc(gh<_i59.SignUpUseCase>()));
    gh.lazySingleton<_i116.ProductInventoryBloc>(() =>
        _i116.ProductInventoryBloc(gh<_i97.GetProductInventoryUseCase>()));
    gh.lazySingleton<_i117.ProductInventoryInputBloc>(
      () => _i117.ProductInventoryInputBloc(
        gh<_i79.GetProductsUseCase>(),
        gh<_i99.CreateWarehouseInputUseCase>(),
        gh<_i100.CreateProductBatchesUseCase>(),
        gh<_i98.GetWarehousesUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i118.UpsertCartItemUseCase>(
        () => _i118.UpsertCartItemUseCase(gh<_i83.ShoppingCartRepo>()));
    gh.lazySingleton<_i119.DeleteCartItemsUseCase>(
        () => _i119.DeleteCartItemsUseCase(gh<_i83.ShoppingCartRepo>()));
    gh.lazySingleton<_i120.GetShoppingCartByIdUseCase>(
        () => _i120.GetShoppingCartByIdUseCase(gh<_i83.ShoppingCartRepo>()));
    gh.lazySingleton<_i121.GetShoppingCartUseCase>(
        () => _i121.GetShoppingCartUseCase(gh<_i83.ShoppingCartRepo>()));
    gh.lazySingleton<_i122.ProductPropertiesInputBloc>(() =>
        _i122.ProductPropertiesInputBloc(
            gh<_i82.GetPropertyTemplateOfCateUseCase>()));
    gh.lazySingleton<_i123.GetPaymentMethodsUseCase>(
        () => _i123.GetPaymentMethodsUseCase(gh<_i70.PaymentRepo>()));
    gh.lazySingleton<_i124.GetProductCateByIdUseCase>(
        () => _i124.GetProductCateByIdUseCase(gh<_i88.ProductCateRepo>()));
    gh.lazySingleton<_i125.ShopOrderBloc>(() => _i125.ShopOrderBloc(
          gh<_i103.GetOrdersUseCase>(),
          gh<_i107.GetCompleteProcessingOrdersUseCase>(),
        ));
    gh.lazySingleton<_i126.OrderBloc>(
      () => _i126.OrderBloc(gh<_i104.CreateOrderUseCase>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i127.NotificationBloc>(() => _i127.NotificationBloc(
          gh<_i67.GetNotificationsUseCase>(),
          gh<_i68.GetNotificationOverviewUseCase>(),
        ));
    gh.lazySingleton<_i128.ShoppingCartBloc>(() => _i128.ShoppingCartBloc(
          gh<_i121.GetShoppingCartUseCase>(),
          gh<_i118.UpsertCartItemUseCase>(),
          gh<_i119.DeleteCartItemsUseCase>(),
        ));
    gh.lazySingleton<_i129.OrderProcessBloc>(() => _i129.OrderProcessBloc(
          gh<_i105.StartProcessingOrderUseCase>(),
          gh<_i106.CompleteProcessingOrderUseCase>(),
          gh<_i108.RequestPartnerDeliveryUsecase>(),
        ));
    gh.lazySingleton<_i130.ProductCateInputBloc>(
        () => _i130.ProductCateInputBloc(
              gh<_i78.GetProductCatesUseCase>(),
              gh<_i124.GetProductCateByIdUseCase>(),
            ));
    gh.lazySingleton<_i131.UserBloc>(
        () => _i131.UserBloc(gh<_i112.GetUserDetailUseCase>()));
    gh.lazySingleton<_i132.PaymentMethodInpBloc>(
        () => _i132.PaymentMethodInpBloc(gh<_i123.GetPaymentMethodsUseCase>()));
    return this;
  }
}

class _$CacheProvider extends _i33.CacheProvider {}

class _$AppModuleDepedenciesProvider
    extends _i133.AppModuleDepedenciesProvider {}

class _$PaymentDatasourceProvider extends _i35.PaymentDatasourceProvider {}

class _$OrderDatasourceProvider extends _i36.OrderDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i37.AuthRepoteDatasourceProvider {}

class _$NotificationDatasourceProvider
    extends _i38.NotificationDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i39.ShopRepoteDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i40.WarehouseRemoteDatasourceProvider {}

class _$AdsDatasourceProvider extends _i41.AdsDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i42.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i43.ProductRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i44.AddressDatasourceProvider {}

class _$UserDatasourceProvider extends _i45.UserDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i46.ShoppingCartDatasourceProvider {}
