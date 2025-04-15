// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i695;
import 'package:evievm_app/core/cache/panda_cache_provider.dart' as _i132;
import 'package:evievm_app/core/interceptors/api_log_interceptor.dart' as _i990;
import 'package:evievm_app/core/interceptors/auth_interceptor.dart' as _i144;
import 'package:evievm_app/core/interceptors/pagination_interceptor.dart'
    as _i597;
import 'package:evievm_app/core/utils/storage.dart' as _i606;
import 'package:evievm_app/src/config/di/injection.dart' as _i149;
import 'package:evievm_app/src/features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i1002;
import 'package:evievm_app/src/features/auth/data/repositories/auth_repo_impl.dart'
    as _i399;
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart'
    as _i317;
import 'package:evievm_app/src/features/auth/domain/use_cases/check_login_usecase.dart'
    as _i1015;
import 'package:evievm_app/src/features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i644;
import 'package:evievm_app/src/features/auth/domain/use_cases/login_usecase.dart'
    as _i117;
import 'package:evievm_app/src/features/auth/domain/use_cases/logout_usecase.dart'
    as _i622;
import 'package:evievm_app/src/features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i451;
import 'package:evievm_app/src/features/auth/domain/use_cases/sign_up_usecase.dart'
    as _i708;
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart'
    as _i168;
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i778;
import 'package:evievm_app/src/features/common/data/data_sources/address_data_soruce.dart'
    as _i178;
import 'package:evievm_app/src/features/common/data/data_sources/user_data_source.dart'
    as _i282;
import 'package:evievm_app/src/features/common/data/repos/address_repo_impl.dart'
    as _i705;
import 'package:evievm_app/src/features/common/data/repos/user_repo_impl.dart'
    as _i104;
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart'
    as _i747;
import 'package:evievm_app/src/features/common/domain/repos/user_repo.dart'
    as _i874;
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i517;
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i92;
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart'
    as _i834;
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i673;
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i754;
import 'package:evievm_app/src/features/common/domain/use_cases/map/map_tracking_usecase.dart'
    as _i632;
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i277;
import 'package:evievm_app/src/features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i894;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/edit_image_use_case.dart'
    as _i674;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i357;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i523;
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart'
    as _i637;
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i1030;
import 'package:evievm_app/src/features/common/presentation/bloc/map_address/map_address_bloc.dart'
    as _i590;
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_bloc.dart'
    as _i357;
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_communicaton.dart'
    as _i635;
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart'
    as _i895;
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart'
    as _i476;
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc.dart'
    as _i918;
import 'package:evievm_app/src/features/main/presentation/blocs/main/main_bloc_communicaton.dart'
    as _i43;
import 'package:evievm_app/src/features/notification/data/data_sources/notification_data_source.dart'
    as _i751;
import 'package:evievm_app/src/features/notification/data/repos/notification_repo_impl.dart'
    as _i459;
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart'
    as _i235;
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i588;
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart'
    as _i64;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i804;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i893;
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart'
    as _i849;
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart'
    as _i1004;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i899;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i195;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i597;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i329;
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart'
    as _i1031;
import 'package:evievm_app/src/features/order/data/data_sources/payment_data_soruce.dart'
    as _i784;
import 'package:evievm_app/src/features/order/data/repos/order_repo_impl.dart'
    as _i606;
import 'package:evievm_app/src/features/order/data/repos/payment_repo_impl.dart'
    as _i623;
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart'
    as _i819;
import 'package:evievm_app/src/features/order/domain/repos/payment_repo.dart'
    as _i875;
import 'package:evievm_app/src/features/order/domain/use_cases/create_order_usecase.dart'
    as _i49;
import 'package:evievm_app/src/features/order/domain/use_cases/get_complete_processing_orders_usecase.dart'
    as _i878;
import 'package:evievm_app/src/features/order/domain/use_cases/get_delivering_orders_usecase.dart'
    as _i722;
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart'
    as _i0;
import 'package:evievm_app/src/features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i704;
import 'package:evievm_app/src/features/order/domain/use_cases/get_waiting_delivery_orders_usecase.dart'
    as _i687;
import 'package:evievm_app/src/features/order/domain/use_cases/request_partner_delivery_usecase.dart'
    as _i922;
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i871;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart'
    as _i683;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i250;
import 'package:evievm_app/src/features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i701;
import 'package:evievm_app/src/features/panvideo/data/data_sources/panvideo_data_source.dart'
    as _i116;
import 'package:evievm_app/src/features/panvideo/data/repositories/panvideo_repo_impl.dart'
    as _i134;
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart'
    as _i490;
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/create_panvideo_usecase.dart'
    as _i1065;
import 'package:evievm_app/src/features/panvideo/domain/use_cases/create/gen_thumbnail_image_usecase.dart'
    as _i826;
import 'package:evievm_app/src/features/panvideo/domain/use_cases/my_panvideos/get_my_panvideos_usecase.dart'
    as _i369;
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart'
    as _i582;
import 'package:evievm_app/src/features/panvideo/presentation/bloc/my_panvideo/my_panvideo_bloc.dart'
    as _i1054;
import 'package:evievm_app/src/features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i293;
import 'package:evievm_app/src/features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i706;
import 'package:evievm_app/src/features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i37;
import 'package:evievm_app/src/features/product/data/repos/ads_repo_impl.dart'
    as _i1001;
import 'package:evievm_app/src/features/product/data/repos/product_repo_cate_impl.dart'
    as _i287;
import 'package:evievm_app/src/features/product/data/repos/product_repo_impl.dart'
    as _i159;
import 'package:evievm_app/src/features/product/domain/repos/ads_repo.dart'
    as _i654;
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart'
    as _i1021;
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart'
    as _i118;
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i576;
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i906;
import 'package:evievm_app/src/features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i393;
import 'package:evievm_app/src/features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i553;
import 'package:evievm_app/src/features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i63;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i121;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i23;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i1034;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i1041;
import 'package:evievm_app/src/features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i1007;
import 'package:evievm_app/src/features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i972;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i921;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i1067;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i323;
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i784;
import 'package:evievm_app/src/features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i222;
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart'
    as _i870;
import 'package:evievm_app/src/features/shop/data/repositories/shop_repo_impl.dart'
    as _i491;
import 'package:evievm_app/src/features/shop/data/repositories/warehouse_repo_impl.dart'
    as _i310;
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart'
    as _i681;
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart'
    as _i624;
import 'package:evievm_app/src/features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i1066;
import 'package:evievm_app/src/features/shop/domain/use_cases/logout_usecase.dart'
    as _i193;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i175;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i71;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i303;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i862;
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i859;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i269;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i261;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i122;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i235;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i654;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i226;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i611;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i957;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i126;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart'
    as _i5;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i584;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i749;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc_communication.dart'
    as _i873;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i19;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i111;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i299;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i466;
import 'package:evievm_app/src/features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i253;
import 'package:evievm_app/src/features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i862;
import 'package:evievm_app/src/features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i981;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i312;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i2;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i932;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i350;
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i986;
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart'
    as _i765;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
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
    final panvideoDatasourceProvider = _$PanvideoDatasourceProvider();
    final addressDatasourceProvider = _$AddressDatasourceProvider();
    final userDatasourceProvider = _$UserDatasourceProvider();
    final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
    gh.singleton<_i695.CacheStore>(() => cacheProvider.provideCacheStore());
    gh.lazySingleton<_i597.PaginationInterceptor>(
        () => _i597.PaginationInterceptor());
    gh.lazySingleton<_i990.ApiLogInterceptor>(() => _i990.ApiLogInterceptor());
    await gh.lazySingletonAsync<_i606.Storage>(
      () => appModuleDepedenciesProvider.provideStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i871.DeliveryMethodInpBloc>(
        () => _i871.DeliveryMethodInpBloc());
    gh.lazySingleton<_i250.OrderBlocCommunication>(
        () => _i250.OrderBlocCommunication());
    gh.lazySingleton<_i849.PushNotificationUseCases>(
        () => _i849.PushNotificationUseCases());
    gh.lazySingleton<_i64.FCMNotificationsUseCases>(
        () => _i64.FCMNotificationsUseCases());
    gh.lazySingleton<_i597.PushNotificationCommunication>(
        () => _i597.PushNotificationCommunication());
    gh.lazySingleton<_i611.ProductInventoryInputCommunication>(
        () => _i611.ProductInventoryInputCommunication());
    gh.lazySingleton<_i466.ShopProductDetailCommunication>(
        () => _i466.ShopProductDetailCommunication());
    gh.lazySingleton<_i19.ShopProductCommunication>(
        () => _i19.ShopProductCommunication());
    gh.lazySingleton<_i957.ProductOptionsInputBloc>(
        () => _i957.ProductOptionsInputBloc());
    gh.lazySingleton<_i873.ShopOrderBlocCommunication>(
        () => _i873.ShopOrderBlocCommunication());
    gh.lazySingleton<_i323.ProductOptionCommunication>(
        () => _i323.ProductOptionCommunication());
    gh.lazySingleton<_i1067.ProductOptionBloc>(
        () => _i1067.ProductOptionBloc());
    gh.lazySingleton<_i674.EditImageUseCase>(() => _i674.EditImageUseCase());
    gh.lazySingleton<_i632.MapTrackingUsecase>(
        () => _i632.MapTrackingUsecase());
    gh.lazySingleton<_i834.GetMapPlaceDetailUseCase>(
        () => _i834.GetMapPlaceDetailUseCase());
    gh.lazySingleton<_i590.MapAddressBloc>(() => _i590.MapAddressBloc());
    gh.lazySingleton<_i635.MapDeliveryTrackingCommunication>(
        () => _i635.MapDeliveryTrackingCommunication());
    gh.lazySingleton<_i43.MainCommunication>(() => _i43.MainCommunication());
    gh.lazySingleton<_i523.PickLocalImageUseCase>(
        () => _i523.PickLocalImageUseCase(gh<_i674.EditImageUseCase>()));
    gh.lazySingleton<_i195.PushNotificationBloc>(
        () => _i195.PushNotificationBloc(gh<_i849.PushNotificationUseCases>()));
    gh.lazySingleton<_i357.MapDeliveryTrackingBloc>(
        () => _i357.MapDeliveryTrackingBloc(gh<_i632.MapTrackingUsecase>()));
    gh.singleton<_i695.CacheOptions>(
        () => cacheProvider.provideBaseCacheOptions(gh<_i695.CacheStore>()));
    gh.lazySingleton<_i357.PickLocalImageCompressedBase64UseCase>(() =>
        _i357.PickLocalImageCompressedBase64UseCase(
            gh<_i523.PickLocalImageUseCase>()));
    gh.lazySingleton<_i144.AuthInterceptor>(
        () => _i144.AuthInterceptor(gh<_i606.Storage>()));
    gh.lazySingleton<_i622.LogoutUseCase>(
        () => _i622.LogoutUseCase(gh<_i606.Storage>()));
    gh.lazySingleton<_i1015.CheckLoginUseCase>(
        () => _i1015.CheckLoginUseCase(gh<_i606.Storage>()));
    gh.lazySingleton<_i644.GetRememberLoginEmailUserCase>(
        () => _i644.GetRememberLoginEmailUserCase(gh<_i606.Storage>()));
    gh.lazySingleton<_i329.SignalRBloc>(
        () => _i329.SignalRBloc(gh<_i606.Storage>()));
    gh.lazySingleton<_i193.LogoutUseCase>(
        () => _i193.LogoutUseCase(gh<_i606.Storage>()));
    gh.lazySingleton<_i1066.GetRememberLoginEmailUserCase>(
        () => _i1066.GetRememberLoginEmailUserCase(gh<_i606.Storage>()));
    gh.lazySingleton<_i918.MainBloc>(() => _i918.MainBloc(gh<_i606.Storage>()));
    gh.lazySingleton<_i765.ImageInputBloc>(
      () => _i765.ImageInputBloc(
          gh<_i357.PickLocalImageCompressedBase64UseCase>()),
      dispose: (i) => i.onClose(),
    );
    gh.singleton<_i132.CacheMaxStaleModifierInterceptor>(() => cacheProvider
        .provideCacheMaxStaleModifierInterceptor(gh<_i695.CacheOptions>()));
    gh.singleton<_i695.DioCacheInterceptor>(() =>
        cacheProvider.provideDioCacheInterceptor(gh<_i695.CacheOptions>()));
    gh.singleton<_i361.Dio>(
        () => appModuleDepedenciesProvider.provideNetworkDio(
              gh<_i144.AuthInterceptor>(),
              gh<_i990.ApiLogInterceptor>(),
              gh<_i132.CacheMaxStaleModifierInterceptor>(),
              gh<_i695.DioCacheInterceptor>(),
            ));
    gh.singleton<_i784.PaymentDatasource>(() =>
        paymentDatasourceProvider.providePaymentDatasource(gh<_i361.Dio>()));
    gh.singleton<_i1031.OrderDatasource>(
        () => orderDatasourceProvider.provideOrderDatasource(gh<_i361.Dio>()));
    gh.singleton<_i1002.AuthRepoteDatasource>(() => authRepoteDatasourceProvider
        .provideAuthRepoteDatasource(gh<_i361.Dio>()));
    gh.singleton<_i751.NotificationDatasource>(() =>
        notificationDatasourceProvider
            .provideNotificationDatasource(gh<_i361.Dio>()));
    gh.singleton<_i222.ShopRemoteDatasource>(() => shopRepoteDatasourceProvider
        .provideShopRepoteDatasource(gh<_i361.Dio>()));
    gh.singleton<_i870.WarehouseRemoteDatasource>(() =>
        warehouseRemoteDatasourceProvider
            .provideWarehouseRemoteDatasource(gh<_i361.Dio>()));
    gh.singleton<_i293.AdsDatasource>(
        () => adsDatasourceProvider.provideAdsDatasource(gh<_i361.Dio>()));
    gh.singleton<_i706.ProductCateDatasource>(() =>
        productCateDatasourceProvider
            .provideProductCateDatasource(gh<_i361.Dio>()));
    gh.singleton<_i37.ProductRemoteDatasource>(() =>
        productRemoteDatasourceProvider
            .provideProductRemoteDatasource(gh<_i361.Dio>()));
    gh.singleton<_i116.PanvideoDatasource>(() =>
        panvideoDatasourceProvider.providePanvideoDatasoure(gh<_i361.Dio>()));
    gh.singleton<_i178.AddressDatasource>(() =>
        addressDatasourceProvider.provideAddressDatasource(gh<_i361.Dio>()));
    gh.singleton<_i282.UserDatasource>(
        () => userDatasourceProvider.provideUserDatasource(gh<_i361.Dio>()));
    gh.singleton<_i253.ShoppingCartDatasource>(() =>
        shoppingCartDatasourceProvider
            .provideShoppingCartDatasource(gh<_i361.Dio>()));
    gh.lazySingleton<_i317.AuthRepo>(
        () => _i399.AuthRepoImpl(gh<_i1002.AuthRepoteDatasource>()));
    gh.lazySingleton<_i235.NotificationRepo>(
        () => _i459.NotificationRepoImpl(gh<_i751.NotificationDatasource>()));
    gh.lazySingleton<_i747.AddressRepo>(
        () => _i705.AddressRepoImpl(gh<_i178.AddressDatasource>()));
    gh.lazySingleton<_i754.GetProvincesAndCitiesUseCase>(
        () => _i754.GetProvincesAndCitiesUseCase(gh<_i747.AddressRepo>()));
    gh.lazySingleton<_i673.GetMyAddressesUseCase>(
        () => _i673.GetMyAddressesUseCase(gh<_i747.AddressRepo>()));
    gh.lazySingleton<_i92.GetDistrictsUseCase>(
        () => _i92.GetDistrictsUseCase(gh<_i747.AddressRepo>()));
    gh.lazySingleton<_i277.SaveMyAddressUseCase>(
        () => _i277.SaveMyAddressUseCase(gh<_i747.AddressRepo>()));
    gh.lazySingleton<_i517.GetCommunesAndWardsUseCase>(
        () => _i517.GetCommunesAndWardsUseCase(gh<_i747.AddressRepo>()));
    gh.lazySingleton<_i117.EmailLoginUseCase>(() => _i117.EmailLoginUseCase(
          gh<_i317.AuthRepo>(),
          gh<_i606.Storage>(),
        ));
    gh.lazySingleton<_i708.SignUpUseCase>(
        () => _i708.SignUpUseCase(gh<_i317.AuthRepo>()));
    gh.lazySingleton<_i681.ShopRepo>(
        () => _i491.ShopRepoImpl(gh<_i222.ShopRemoteDatasource>()));
    gh.factory<_i637.AddressBloc>(() => _i637.AddressBloc(
          gh<_i673.GetMyAddressesUseCase>(),
          gh<_i754.GetProvincesAndCitiesUseCase>(),
          gh<_i92.GetDistrictsUseCase>(),
          gh<_i517.GetCommunesAndWardsUseCase>(),
        ));
    gh.lazySingleton<_i451.QrBarcodeLoginUseCase>(
        () => _i451.QrBarcodeLoginUseCase(
              gh<_i317.AuthRepo>(),
              gh<_i117.EmailLoginUseCase>(),
            ));
    gh.lazySingleton<_i490.PanvideoRepo>(
        () => _i134.PanvideoRepoImpl(gh<_i116.PanvideoDatasource>()));
    gh.lazySingleton<_i654.AdsRepo>(
        () => _i1001.AdsRepoImpl(gh<_i293.AdsDatasource>()));
    gh.lazySingleton<_i588.CreateNotificationReceiverUseCase>(() =>
        _i588.CreateNotificationReceiverUseCase(gh<_i235.NotificationRepo>()));
    gh.lazySingleton<_i893.GetNotificationsUseCase>(
        () => _i893.GetNotificationsUseCase(gh<_i235.NotificationRepo>()));
    gh.lazySingleton<_i804.GetNotificationOverviewUseCase>(() =>
        _i804.GetNotificationOverviewUseCase(gh<_i235.NotificationRepo>()));
    gh.lazySingleton<_i906.GetHomeBannersUseCase>(
        () => _i906.GetHomeBannersUseCase(gh<_i654.AdsRepo>()));
    gh.lazySingleton<_i875.PaymentRepo>(
        () => _i623.PaymentRepoImpl(gh<_i784.PaymentDatasource>()));
    gh.lazySingleton<_i118.ProductRepo>(
        () => _i159.ProductRepoImpl(gh<_i37.ProductRemoteDatasource>()));
    gh.lazySingleton<_i553.CreateProductUseCase>(
        () => _i553.CreateProductUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i972.UpdateProductUseCase>(
        () => _i972.UpdateProductUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i63.DeleteProductUseCase>(
        () => _i63.DeleteProductUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i1007.SearchProductsUserCase>(
        () => _i1007.SearchProductsUserCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i23.GetProductCatesUseCase>(
        () => _i23.GetProductCatesUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i1041.GetProductsUseCase>(
        () => _i1041.GetProductsUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i1034.GetProductDetailUseCase>(
        () => _i1034.GetProductDetailUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i393.CreateProductImagesUseCase>(
        () => _i393.CreateProductImagesUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i576.GetPropertyTemplateOfCateUseCase>(
        () => _i576.GetPropertyTemplateOfCateUseCase(gh<_i118.ProductRepo>()));
    gh.lazySingleton<_i981.ShoppingCartRepo>(
        () => _i862.ShoppingCartRepoImpl(gh<_i253.ShoppingCartDatasource>()));
    gh.lazySingleton<_i624.WarehouseRepo>(
        () => _i310.WarehouseRepoImpl(gh<_i870.WarehouseRemoteDatasource>()));
    gh.lazySingleton<_i168.LoginBloc>(() => _i168.LoginBloc(
          gh<_i117.EmailLoginUseCase>(),
          gh<_i451.QrBarcodeLoginUseCase>(),
          gh<_i1015.CheckLoginUseCase>(),
          gh<_i622.LogoutUseCase>(),
          gh<_i644.GetRememberLoginEmailUserCase>(),
        ));
    gh.lazySingleton<_i1021.ProductCateRepo>(
        () => _i287.ProductRepoImpl(gh<_i706.ProductCateDatasource>()));
    gh.lazySingleton<_i826.GenThumbnailImageUsecase>(
        () => _i826.GenThumbnailImageUsecase(repo: gh<_i490.PanvideoRepo>()));
    gh.lazySingleton<_i1065.CreatePanvideoUsecase>(
        () => _i1065.CreatePanvideoUsecase(repo: gh<_i490.PanvideoRepo>()));
    gh.lazySingleton<_i874.UserRepo>(
        () => _i104.UserRepoImpl(gh<_i282.UserDatasource>()));
    gh.lazySingleton<_i1030.AddressInputBloc>(
        () => _i1030.AddressInputBloc(gh<_i277.SaveMyAddressUseCase>()));
    gh.lazySingleton<_i476.HomeBloc>(() => _i476.HomeBloc(
          gh<_i1041.GetProductsUseCase>(),
          gh<_i23.GetProductCatesUseCase>(),
          gh<_i906.GetHomeBannersUseCase>(),
        ));
    gh.lazySingleton<_i582.CreatePanVideoBloc>(() => _i582.CreatePanVideoBloc(
          gh<_i1065.CreatePanvideoUsecase>(),
          gh<_i826.GenThumbnailImageUsecase>(),
        ));
    gh.lazySingleton<_i921.ProductDetailBloc>(
        () => _i921.ProductDetailBloc(gh<_i1034.GetProductDetailUseCase>()));
    gh.lazySingleton<_i899.FCMBloc>(() => _i899.FCMBloc(
          gh<_i588.CreateNotificationReceiverUseCase>(),
          gh<_i64.FCMNotificationsUseCases>(),
        ));
    gh.lazySingleton<_i819.OrderRepo>(
        () => _i606.OrderRepoImpl(gh<_i1031.OrderDatasource>()));
    gh.lazySingleton<_i303.GetProductInventoryUseCase>(
        () => _i303.GetProductInventoryUseCase(gh<_i624.WarehouseRepo>()));
    gh.lazySingleton<_i862.GetWarehousesUseCase>(
        () => _i862.GetWarehousesUseCase(gh<_i624.WarehouseRepo>()));
    gh.lazySingleton<_i71.CreateWarehouseInputUseCase>(
        () => _i71.CreateWarehouseInputUseCase(gh<_i624.WarehouseRepo>()));
    gh.lazySingleton<_i175.CreateProductBatchesUseCase>(
        () => _i175.CreateProductBatchesUseCase(gh<_i624.WarehouseRepo>()));
    gh.lazySingleton<_i111.ShopProductBloc>(() => _i111.ShopProductBloc(
          gh<_i1041.GetProductsUseCase>(),
          gh<_i23.GetProductCatesUseCase>(),
          gh<_i906.GetHomeBannersUseCase>(),
          gh<_i63.DeleteProductUseCase>(),
        ));
    gh.lazySingleton<_i0.GetOrdersUseCase>(
        () => _i0.GetOrdersUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i722.GetDeliveringOrdersUseCase>(
        () => _i722.GetDeliveringOrdersUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i687.GetWaitingDeliveryOrdersUseCase>(
        () => _i687.GetWaitingDeliveryOrdersUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i49.CreateOrderUseCase>(
        () => _i49.CreateOrderUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i922.RequestPartnerDeliveryUsecase>(
        () => _i922.RequestPartnerDeliveryUsecase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i878.GetCompleteProcessingOrdersUseCase>(
        () => _i878.GetCompleteProcessingOrdersUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i261.StartProcessingOrderUseCase>(
        () => _i261.StartProcessingOrderUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i269.CompleteProcessingOrderUseCase>(
        () => _i269.CompleteProcessingOrderUseCase(gh<_i819.OrderRepo>()));
    gh.lazySingleton<_i654.ProductBatchInputBloc>(() =>
        _i654.ProductBatchInputBloc(gh<_i1034.GetProductDetailUseCase>()));
    gh.lazySingleton<_i859.RegisterShopUseCase>(
        () => _i859.RegisterShopUseCase(gh<_i681.ShopRepo>()));
    gh.lazySingleton<_i5.ShopBloc>(
        () => _i5.ShopBloc(gh<_i859.RegisterShopUseCase>()));
    gh.lazySingleton<_i894.GetUserDetailUseCase>(
        () => _i894.GetUserDetailUseCase(gh<_i874.UserRepo>()));
    gh.lazySingleton<_i299.ShopProductDetailBloc>(
      () => _i299.ShopProductDetailBloc(
        gh<_i1034.GetProductDetailUseCase>(),
        gh<_i553.CreateProductUseCase>(),
        gh<_i393.CreateProductImagesUseCase>(),
        gh<_i972.UpdateProductUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i784.SearchProductsBloc>(() => _i784.SearchProductsBloc(
          gh<_i1007.SearchProductsUserCase>(),
          gh<_i1041.GetProductsUseCase>(),
        ));
    gh.lazySingleton<_i778.SignUpBloc>(
        () => _i778.SignUpBloc(gh<_i708.SignUpUseCase>()));
    gh.lazySingleton<_i235.ProductInventoryBloc>(() =>
        _i235.ProductInventoryBloc(gh<_i303.GetProductInventoryUseCase>()));
    gh.lazySingleton<_i226.ProductInventoryInputBloc>(
      () => _i226.ProductInventoryInputBloc(
        gh<_i1041.GetProductsUseCase>(),
        gh<_i71.CreateWarehouseInputUseCase>(),
        gh<_i175.CreateProductBatchesUseCase>(),
        gh<_i862.GetWarehousesUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i350.UpsertCartItemUseCase>(
        () => _i350.UpsertCartItemUseCase(gh<_i981.ShoppingCartRepo>()));
    gh.lazySingleton<_i312.DeleteCartItemsUseCase>(
        () => _i312.DeleteCartItemsUseCase(gh<_i981.ShoppingCartRepo>()));
    gh.lazySingleton<_i2.GetShoppingCartByIdUseCase>(
        () => _i2.GetShoppingCartByIdUseCase(gh<_i981.ShoppingCartRepo>()));
    gh.lazySingleton<_i932.GetShoppingCartUseCase>(
        () => _i932.GetShoppingCartUseCase(gh<_i981.ShoppingCartRepo>()));
    gh.lazySingleton<_i126.ProductPropertiesInputBloc>(() =>
        _i126.ProductPropertiesInputBloc(
            gh<_i576.GetPropertyTemplateOfCateUseCase>()));
    gh.lazySingleton<_i749.ShopOrderBloc>(() => _i749.ShopOrderBloc(
          gh<_i0.GetOrdersUseCase>(),
          gh<_i878.GetCompleteProcessingOrdersUseCase>(),
          gh<_i687.GetWaitingDeliveryOrdersUseCase>(),
          gh<_i722.GetDeliveringOrdersUseCase>(),
        ));
    gh.lazySingleton<_i704.GetPaymentMethodsUseCase>(
        () => _i704.GetPaymentMethodsUseCase(gh<_i875.PaymentRepo>()));
    gh.lazySingleton<_i369.GetMyPanvideosUseCase>(
        () => _i369.GetMyPanvideosUseCase(gh<_i490.PanvideoRepo>()));
    gh.lazySingleton<_i121.GetProductCateByIdUseCase>(
        () => _i121.GetProductCateByIdUseCase(gh<_i1021.ProductCateRepo>()));
    gh.lazySingleton<_i683.OrderBloc>(
      () => _i683.OrderBloc(gh<_i49.CreateOrderUseCase>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i1004.NotificationBloc>(() => _i1004.NotificationBloc(
          gh<_i893.GetNotificationsUseCase>(),
          gh<_i804.GetNotificationOverviewUseCase>(),
        ));
    gh.lazySingleton<_i986.ShoppingCartBloc>(() => _i986.ShoppingCartBloc(
          gh<_i932.GetShoppingCartUseCase>(),
          gh<_i350.UpsertCartItemUseCase>(),
          gh<_i312.DeleteCartItemsUseCase>(),
        ));
    gh.lazySingleton<_i584.OrderProcessBloc>(() => _i584.OrderProcessBloc(
          gh<_i261.StartProcessingOrderUseCase>(),
          gh<_i269.CompleteProcessingOrderUseCase>(),
          gh<_i922.RequestPartnerDeliveryUsecase>(),
        ));
    gh.lazySingleton<_i122.ProductCateInputBloc>(
        () => _i122.ProductCateInputBloc(
              gh<_i23.GetProductCatesUseCase>(),
              gh<_i121.GetProductCateByIdUseCase>(),
            ));
    gh.lazySingleton<_i895.UserBloc>(
        () => _i895.UserBloc(gh<_i894.GetUserDetailUseCase>()));
    gh.lazySingleton<_i1054.MyPanVideoBloc>(
        () => _i1054.MyPanVideoBloc(gh<_i369.GetMyPanvideosUseCase>()));
    gh.lazySingleton<_i701.PaymentMethodInpBloc>(
        () => _i701.PaymentMethodInpBloc(gh<_i704.GetPaymentMethodsUseCase>()));
    return this;
  }
}

class _$CacheProvider extends _i132.CacheProvider {}

class _$AppModuleDepedenciesProvider
    extends _i149.AppModuleDepedenciesProvider {}

class _$PaymentDatasourceProvider extends _i784.PaymentDatasourceProvider {}

class _$OrderDatasourceProvider extends _i1031.OrderDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i1002.AuthRepoteDatasourceProvider {}

class _$NotificationDatasourceProvider
    extends _i751.NotificationDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i222.ShopRepoteDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i870.WarehouseRemoteDatasourceProvider {}

class _$AdsDatasourceProvider extends _i293.AdsDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i706.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i37.ProductRemoteDatasourceProvider {}

class _$PanvideoDatasourceProvider extends _i116.PanvideoDatasourceProvider {}

class _$AddressDatasourceProvider extends _i178.AddressDatasourceProvider {}

class _$UserDatasourceProvider extends _i282.UserDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i253.ShoppingCartDatasourceProvider {}
