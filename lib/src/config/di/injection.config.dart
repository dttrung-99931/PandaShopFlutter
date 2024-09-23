// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i30;
import 'package:evievm_app/core/interceptors/api_interceptor.dart' as _i21;
import 'package:evievm_app/core/interceptors/pagination_interceptor.dart' as _i3;
import 'package:evievm_app/core/utils/storage.dart' as _i4;
import 'package:evievm_app/src/config/di/injection.dart' as _i127;
import 'package:evievm_app/src/features/auth/data/data_sources/auth_remote_data_soruce.dart' as _i33;
import 'package:evievm_app/src/features/auth/data/repositories/auth_repo_impl.dart' as _i44;
import 'package:evievm_app/src/features/auth/domain/repositories/auth_repo.dart' as _i43;
import 'package:evievm_app/src/features/auth/domain/use_cases/check_login_usecase.dart' as _i23;
import 'package:evievm_app/src/features/auth/domain/use_cases/get_remember_login_email_usecase.dart' as _i24;
import 'package:evievm_app/src/features/auth/domain/use_cases/login_usecase.dart' as _i54;
import 'package:evievm_app/src/features/auth/domain/use_cases/logout_usecase.dart' as _i22;
import 'package:evievm_app/src/features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart' as _i59;
import 'package:evievm_app/src/features/auth/domain/use_cases/sign_up_usecase.dart' as _i55;
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart' as _i83;
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i109;
import 'package:evievm_app/src/features/common/data/data_sources/address_data_soruce.dart' as _i40;
import 'package:evievm_app/src/features/common/data/data_sources/user_data_source.dart' as _i41;
import 'package:evievm_app/src/features/common/data/repos/address_repo_impl.dart' as _i48;
import 'package:evievm_app/src/features/common/data/repos/user_repo_impl.dart' as _i87;
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart' as _i47;
import 'package:evievm_app/src/features/common/domain/repos/user_repo.dart' as _i86;
import 'package:evievm_app/src/features/common/domain/use_cases/get_communes_and_ward_usecase.dart' as _i53;
import 'package:evievm_app/src/features/common/domain/use_cases/get_district_usecase_usecase.dart' as _i51;
import 'package:evievm_app/src/features/common/domain/use_cases/get_map_place_detail_usecase.dart' as _i17;
import 'package:evievm_app/src/features/common/domain/use_cases/get_my_addresses_usecase.dart' as _i50;
import 'package:evievm_app/src/features/common/domain/use_cases/get_provinces_and_cities_usecase.dart' as _i49;
import 'package:evievm_app/src/features/common/domain/use_cases/save_my_address_usecase.dart' as _i52;
import 'package:evievm_app/src/features/common/domain/use_cases/user/get_user_detail_usecase.dart' as _i106;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart' as _i20;
import 'package:evievm_app/src/features/common/domain/use_cases/utils/pick_local_image_use_case.dart' as _i16;
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart' as _i58;
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart' as _i97;
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart' as _i28;
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc_communicaton.dart' as _i18;
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart' as _i125;
import 'package:evievm_app/src/features/home/presentation/bloc/home_bloc.dart' as _i88;
import 'package:evievm_app/src/features/notification/data/data_sources/notification_data_source.dart' as _i34;
import 'package:evievm_app/src/features/notification/data/repos/notification_repo_impl.dart' as _i46;
import 'package:evievm_app/src/features/notification/domain/repos/notification_repo.dart' as _i45;
import 'package:evievm_app/src/features/notification/domain/use_cases/create_notification_receiver_usecase.dart'
    as _i62;
import 'package:evievm_app/src/features/notification/domain/use_cases/fcm_notification_usecases.dart' as _i8;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_overview_usecase.dart' as _i64;
import 'package:evievm_app/src/features/notification/domain/use_cases/get_notifications_usecase.dart' as _i63;
import 'package:evievm_app/src/features/notification/domain/use_cases/push_notification_usecases.dart' as _i7;
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart' as _i120;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/fcm_bloc/fcm_bloc.dart'
    as _i90;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_bloc.dart'
    as _i19;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/push_notification_communication.dart'
    as _i9;
import 'package:evievm_app/src/features/notification/presentation/bloc/push_notification/signalr_bloc/signalr_bloc.dart'
    as _i25;
import 'package:evievm_app/src/features/order/data/data_sources/order_data_source.dart' as _i32;
import 'package:evievm_app/src/features/order/data/data_sources/payment_data_soruce.dart' as _i31;
import 'package:evievm_app/src/features/order/data/repos/order_repo_impl.dart' as _i92;
import 'package:evievm_app/src/features/order/data/repos/payment_repo_impl.dart' as _i67;
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart' as _i91;
import 'package:evievm_app/src/features/order/domain/repos/payment_repo.dart' as _i66;
import 'package:evievm_app/src/features/order/domain/use_cases/create_order_usecase.dart' as _i100;
import 'package:evievm_app/src/features/order/domain/use_cases/get_orders_usecase.dart' as _i99;
import 'package:evievm_app/src/features/order/domain/use_cases/get_payment_methods_usecase.dart' as _i117;
import 'package:evievm_app/src/features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i5;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart' as _i119;
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc_communicaton.dart' as _i6;
import 'package:evievm_app/src/features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i126;
import 'package:evievm_app/src/features/product/data/data_sources/ads/ads_data_soruce.dart' as _i37;
import 'package:evievm_app/src/features/product/data/data_sources/product_cate_data_soruce.dart' as _i38;
import 'package:evievm_app/src/features/product/data/data_sources/product_remote_data_soruce.dart' as _i39;
import 'package:evievm_app/src/features/product/data/repos/ads_repo_impl.dart' as _i61;
import 'package:evievm_app/src/features/product/data/repos/product_repo_cate_impl.dart' as _i85;
import 'package:evievm_app/src/features/product/data/repos/product_repo_impl.dart' as _i69;
import 'package:evievm_app/src/features/product/domain/repos/ads_repo.dart' as _i60;
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart' as _i84;
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart' as _i68;
import 'package:evievm_app/src/features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i78;
import 'package:evievm_app/src/features/product/domain/use_cases/get_home_banners_usecase.dart' as _i65;
import 'package:evievm_app/src/features/product/domain/use_cases/image/create_product_image_usecase.dart' as _i77;
import 'package:evievm_app/src/features/product/domain/use_cases/product/create_product_usecase.dart' as _i70;
import 'package:evievm_app/src/features/product/domain/use_cases/product/delete_product_usecase.dart' as _i72;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart' as _i118;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_cates_usecase.dart' as _i74;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_product_detail_usecase.dart' as _i76;
import 'package:evievm_app/src/features/product/domain/use_cases/product/get_products_usecase.dart' as _i75;
import 'package:evievm_app/src/features/product/domain/use_cases/product/search_products_usecase.dart' as _i73;
import 'package:evievm_app/src/features/product/domain/use_cases/product/update_product_usecase.dart' as _i71;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_detail_bloc.dart' as _i89;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i15;
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i14;
import 'package:evievm_app/src/features/product/presentation/bloc/search/search_products_bloc.dart' as _i108;
import 'package:evievm_app/src/features/shop/data/data_sources/shop_remote_data_soruce.dart' as _i35;
import 'package:evievm_app/src/features/shop/data/data_sources/warehouse_data_source.dart' as _i36;
import 'package:evievm_app/src/features/shop/data/repositories/shop_repo_impl.dart' as _i57;
import 'package:evievm_app/src/features/shop/data/repositories/warehouse_repo_impl.dart' as _i82;
import 'package:evievm_app/src/features/shop/domain/repositories/shop_repo.dart' as _i56;
import 'package:evievm_app/src/features/shop/domain/repositories/warehouse_repo.dart' as _i81;
import 'package:evievm_app/src/features/shop/domain/use_cases/get_remember_login_email_usecase.dart' as _i27;
import 'package:evievm_app/src/features/shop/domain/use_cases/logout_usecase.dart' as _i26;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i96;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i95;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i93;
import 'package:evievm_app/src/features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart' as _i94;
import 'package:evievm_app/src/features/shop/domain/use_cases/register_shop_usecase.dart' as _i104;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i102;
import 'package:evievm_app/src/features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i101;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i122;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart' as _i110;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i103;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i111;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i10;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i13;
import 'package:evievm_app/src/features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i116;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart' as _i105;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i124;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart' as _i123;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart' as _i12;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product/shop_product_bloc.dart' as _i98;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i107;
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i11;
import 'package:evievm_app/src/features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart' as _i42;
import 'package:evievm_app/src/features/shopping_cart/data/repos/shopping_cart_repo_impl.dart' as _i80;
import 'package:evievm_app/src/features/shopping_cart/domain/repos/shopping_cart_repo.dart' as _i79;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart' as _i113;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart' as _i114;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart' as _i115;
import 'package:evievm_app/src/features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart' as _i112;
import 'package:evievm_app/src/features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart' as _i121;
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart' as _i29;
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
    final appModuleDepedenciesProvider = _$AppModuleDepedenciesProvider();
    final paymentDatasourceProvider = _$PaymentDatasourceProvider();
    final orderDatasourceProvider = _$OrderDatasourceProvider();
    final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
    final notificationDatasourceProvider = _$NotificationDatasourceProvider();
    final shopRepoteDatasourceProvider = _$ShopRepoteDatasourceProvider();
    final warehouseRemoteDatasourceProvider = _$WarehouseRemoteDatasourceProvider();
    final adsDatasourceProvider = _$AdsDatasourceProvider();
    final productCateDatasourceProvider = _$ProductCateDatasourceProvider();
    final productRemoteDatasourceProvider = _$ProductRemoteDatasourceProvider();
    final addressDatasourceProvider = _$AddressDatasourceProvider();
    final userDatasourceProvider = _$UserDatasourceProvider();
    final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
    gh.lazySingleton<_i3.PaginationInterceptor>(() => _i3.PaginationInterceptor());
    await gh.lazySingletonAsync<_i4.Storage>(
      () => appModuleDepedenciesProvider.provideStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.DeliveryMethodInpBloc>(() => _i5.DeliveryMethodInpBloc());
    gh.lazySingleton<_i6.OrderBlocCommunication>(() => _i6.OrderBlocCommunication());
    gh.lazySingleton<_i7.PushNotificationUseCases>(() => _i7.PushNotificationUseCases());
    gh.lazySingleton<_i8.FCMNotificationsUseCases>(() => _i8.FCMNotificationsUseCases());
    gh.lazySingleton<_i9.PushNotificationCommunication>(() => _i9.PushNotificationCommunication());
    gh.lazySingleton<_i10.ProductInventoryInputCommunication>(() => _i10.ProductInventoryInputCommunication());
    gh.lazySingleton<_i11.ShopProductDetailCommunication>(() => _i11.ShopProductDetailCommunication());
    gh.lazySingleton<_i12.ShopProductCommunication>(() => _i12.ShopProductCommunication());
    gh.lazySingleton<_i13.ProductOptionsInputBloc>(() => _i13.ProductOptionsInputBloc());
    gh.lazySingleton<_i14.ProductOptionCommunication>(() => _i14.ProductOptionCommunication());
    gh.lazySingleton<_i15.ProductOptionBloc>(() => _i15.ProductOptionBloc());
    gh.lazySingleton<_i16.PickLocalImageUseCase>(() => _i16.PickLocalImageUseCase());
    gh.lazySingleton<_i17.GetMapPlaceDetailUseCase>(() => _i17.GetMapPlaceDetailUseCase());
    gh.lazySingleton<_i18.MainCommunication>(() => _i18.MainCommunication());
    gh.lazySingleton<_i19.PushNotificationBloc>(() => _i19.PushNotificationBloc(gh<_i7.PushNotificationUseCases>()));
    gh.lazySingleton<_i20.PickLocalImageCompressedBase64UseCase>(
        () => _i20.PickLocalImageCompressedBase64UseCase(gh<_i16.PickLocalImageUseCase>()));
    gh.lazySingleton<_i21.ApiInterceptor>(() => _i21.ApiInterceptor(gh<_i4.Storage>()));
    gh.lazySingleton<_i22.LogoutUseCase>(() => _i22.LogoutUseCase(gh<_i4.Storage>()));
    gh.lazySingleton<_i23.CheckLoginUseCase>(() => _i23.CheckLoginUseCase(gh<_i4.Storage>()));
    gh.lazySingleton<_i24.GetRememberLoginEmailUserCase>(() => _i24.GetRememberLoginEmailUserCase(gh<_i4.Storage>()));
    gh.lazySingleton<_i25.SignalRBloc>(() => _i25.SignalRBloc(gh<_i4.Storage>()));
    gh.lazySingleton<_i26.LogoutUseCase>(() => _i26.LogoutUseCase(gh<_i4.Storage>()));
    gh.lazySingleton<_i27.GetRememberLoginEmailUserCase>(() => _i27.GetRememberLoginEmailUserCase(gh<_i4.Storage>()));
    gh.lazySingleton<_i28.MainBloc>(() => _i28.MainBloc(gh<_i4.Storage>()));
    gh.lazySingleton<_i29.ImageInputBloc>(() => _i29.ImageInputBloc(gh<_i20.PickLocalImageCompressedBase64UseCase>()));
    gh.singleton<_i30.Dio>(() => appModuleDepedenciesProvider.provideNetworkDio(gh<_i21.ApiInterceptor>()));
    gh.singleton<_i31.PaymentDatasource>(() => paymentDatasourceProvider.providePaymentDatasource(gh<_i30.Dio>()));
    gh.singleton<_i32.OrderDatasource>(() => orderDatasourceProvider.provideOrderDatasource(gh<_i30.Dio>()));
    gh.singleton<_i33.AuthRepoteDatasource>(
        () => authRepoteDatasourceProvider.provideAuthRepoteDatasource(gh<_i30.Dio>()));
    gh.singleton<_i34.NotificationDatasource>(
        () => notificationDatasourceProvider.provideNotificationDatasource(gh<_i30.Dio>()));
    gh.singleton<_i35.ShopRemoteDatasource>(
        () => shopRepoteDatasourceProvider.provideShopRepoteDatasource(gh<_i30.Dio>()));
    gh.singleton<_i36.WarehouseRemoteDatasource>(
        () => warehouseRemoteDatasourceProvider.provideWarehouseRemoteDatasource(gh<_i30.Dio>()));
    gh.singleton<_i37.AdsDatasource>(() => adsDatasourceProvider.provideAdsDatasource(gh<_i30.Dio>()));
    gh.singleton<_i38.ProductCateDatasource>(
        () => productCateDatasourceProvider.provideProductCateDatasource(gh<_i30.Dio>()));
    gh.singleton<_i39.ProductRemoteDatasource>(
        () => productRemoteDatasourceProvider.provideProductRemoteDatasource(gh<_i30.Dio>()));
    gh.singleton<_i40.AddressDatasource>(() => addressDatasourceProvider.provideAddressDatasource(gh<_i30.Dio>()));
    gh.singleton<_i41.UserDatasource>(() => userDatasourceProvider.provideUserDatasource(gh<_i30.Dio>()));
    gh.singleton<_i42.ShoppingCartDatasource>(
        () => shoppingCartDatasourceProvider.provideShoppingCartDatasource(gh<_i30.Dio>()));
    gh.lazySingleton<_i43.AuthRepo>(() => _i44.AuthRepoImpl(gh<_i33.AuthRepoteDatasource>()));
    gh.lazySingleton<_i45.NotificationRepo>(() => _i46.NotificationRepoImpl(gh<_i34.NotificationDatasource>()));
    gh.lazySingleton<_i47.AddressRepo>(() => _i48.AddressRepoImpl(gh<_i40.AddressDatasource>()));
    gh.lazySingleton<_i49.GetProvincesAndCitiesUseCase>(
        () => _i49.GetProvincesAndCitiesUseCase(gh<_i47.AddressRepo>()));
    gh.lazySingleton<_i50.GetMyAddressesUseCase>(() => _i50.GetMyAddressesUseCase(gh<_i47.AddressRepo>()));
    gh.lazySingleton<_i51.GetDistrictsUseCase>(() => _i51.GetDistrictsUseCase(gh<_i47.AddressRepo>()));
    gh.lazySingleton<_i52.SaveMyAddressUseCase>(() => _i52.SaveMyAddressUseCase(gh<_i47.AddressRepo>()));
    gh.lazySingleton<_i53.GetCommunesAndWardsUseCase>(() => _i53.GetCommunesAndWardsUseCase(gh<_i47.AddressRepo>()));
    gh.lazySingleton<_i54.EmailLoginUseCase>(() => _i54.EmailLoginUseCase(
          gh<_i43.AuthRepo>(),
          gh<_i4.Storage>(),
        ));
    gh.lazySingleton<_i55.SignUpUseCase>(() => _i55.SignUpUseCase(gh<_i43.AuthRepo>()));
    gh.lazySingleton<_i56.ShopRepo>(() => _i57.ShopRepoImpl(gh<_i35.ShopRemoteDatasource>()));
    gh.factory<_i58.AddressBloc>(() => _i58.AddressBloc(
          gh<_i50.GetMyAddressesUseCase>(),
          gh<_i49.GetProvincesAndCitiesUseCase>(),
          gh<_i51.GetDistrictsUseCase>(),
          gh<_i53.GetCommunesAndWardsUseCase>(),
        ));
    gh.lazySingleton<_i59.QrBarcodeLoginUseCase>(() => _i59.QrBarcodeLoginUseCase(
          gh<_i43.AuthRepo>(),
          gh<_i54.EmailLoginUseCase>(),
        ));
    gh.lazySingleton<_i60.AdsRepo>(() => _i61.AdsRepoImpl(gh<_i37.AdsDatasource>()));
    gh.lazySingleton<_i62.CreateNotificationReceiverUseCase>(
        () => _i62.CreateNotificationReceiverUseCase(gh<_i45.NotificationRepo>()));
    gh.lazySingleton<_i63.GetNotificationsUseCase>(() => _i63.GetNotificationsUseCase(gh<_i45.NotificationRepo>()));
    gh.lazySingleton<_i64.GetNotificationOverviewUseCase>(
        () => _i64.GetNotificationOverviewUseCase(gh<_i45.NotificationRepo>()));
    gh.lazySingleton<_i65.GetHomeBannersUseCase>(() => _i65.GetHomeBannersUseCase(gh<_i60.AdsRepo>()));
    gh.lazySingleton<_i66.PaymentRepo>(() => _i67.PaymentRepoImpl(gh<_i31.PaymentDatasource>()));
    gh.lazySingleton<_i68.ProductRepo>(() => _i69.ProductRepoImpl(gh<_i39.ProductRemoteDatasource>()));
    gh.lazySingleton<_i70.CreateProductUseCase>(() => _i70.CreateProductUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i71.UpdateProductUseCase>(() => _i71.UpdateProductUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i72.DeleteProductUseCase>(() => _i72.DeleteProductUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i73.SearchProductsUserCase>(() => _i73.SearchProductsUserCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i74.GetProductCatesUseCase>(() => _i74.GetProductCatesUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i75.GetProductsUseCase>(() => _i75.GetProductsUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i76.GetProductDetailUseCase>(() => _i76.GetProductDetailUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i77.CreateProductImagesUseCase>(() => _i77.CreateProductImagesUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i78.GetPropertyTemplateOfCateUseCase>(
        () => _i78.GetPropertyTemplateOfCateUseCase(gh<_i68.ProductRepo>()));
    gh.lazySingleton<_i79.ShoppingCartRepo>(() => _i80.ShoppingCartRepoImpl(gh<_i42.ShoppingCartDatasource>()));
    gh.lazySingleton<_i81.WarehouseRepo>(() => _i82.WarehouseRepoImpl(gh<_i36.WarehouseRemoteDatasource>()));
    gh.lazySingleton<_i83.LoginBloc>(() => _i83.LoginBloc(
          gh<_i54.EmailLoginUseCase>(),
          gh<_i59.QrBarcodeLoginUseCase>(),
          gh<_i23.CheckLoginUseCase>(),
          gh<_i22.LogoutUseCase>(),
          gh<_i24.GetRememberLoginEmailUserCase>(),
        ));
    gh.lazySingleton<_i84.ProductCateRepo>(() => _i85.ProductRepoImpl(gh<_i38.ProductCateDatasource>()));
    gh.lazySingleton<_i86.UserRepo>(() => _i87.UserRepoImpl(gh<_i41.UserDatasource>()));
    gh.lazySingleton<_i88.HomeBloc>(() => _i88.HomeBloc(
          gh<_i75.GetProductsUseCase>(),
          gh<_i74.GetProductCatesUseCase>(),
          gh<_i65.GetHomeBannersUseCase>(),
        ));
    gh.lazySingleton<_i89.ProductDetailBloc>(() => _i89.ProductDetailBloc(gh<_i76.GetProductDetailUseCase>()));
    gh.lazySingleton<_i90.FCMBloc>(() => _i90.FCMBloc(
          gh<_i62.CreateNotificationReceiverUseCase>(),
          gh<_i8.FCMNotificationsUseCases>(),
        ));
    gh.lazySingleton<_i91.OrderRepo>(() => _i92.OrderRepoImpl(gh<_i32.OrderDatasource>()));
    gh.lazySingleton<_i93.GetProductInventoryUseCase>(() => _i93.GetProductInventoryUseCase(gh<_i81.WarehouseRepo>()));
    gh.lazySingleton<_i94.GetWarehousesUseCase>(() => _i94.GetWarehousesUseCase(gh<_i81.WarehouseRepo>()));
    gh.lazySingleton<_i95.CreateWarehouseInputUseCase>(
        () => _i95.CreateWarehouseInputUseCase(gh<_i81.WarehouseRepo>()));
    gh.lazySingleton<_i96.CreateProductBatchesUseCase>(
        () => _i96.CreateProductBatchesUseCase(gh<_i81.WarehouseRepo>()));
    gh.lazySingleton<_i97.AddressInputBloc>(() => _i97.AddressInputBloc(
          gh<_i52.SaveMyAddressUseCase>(),
          gh<_i17.GetMapPlaceDetailUseCase>(),
        ));
    gh.lazySingleton<_i98.ShopProductBloc>(() => _i98.ShopProductBloc(
          gh<_i75.GetProductsUseCase>(),
          gh<_i74.GetProductCatesUseCase>(),
          gh<_i65.GetHomeBannersUseCase>(),
          gh<_i72.DeleteProductUseCase>(),
        ));
    gh.lazySingleton<_i99.GetOrdersUseCase>(() => _i99.GetOrdersUseCase(gh<_i91.OrderRepo>()));
    gh.lazySingleton<_i100.CreateOrderUseCase>(() => _i100.CreateOrderUseCase(gh<_i91.OrderRepo>()));
    gh.lazySingleton<_i101.StartProcessingOrderUseCase>(() => _i101.StartProcessingOrderUseCase(gh<_i91.OrderRepo>()));
    gh.lazySingleton<_i102.CompleteProcessingOrderUseCase>(
        () => _i102.CompleteProcessingOrderUseCase(gh<_i91.OrderRepo>()));
    gh.lazySingleton<_i103.ProductBatchInputBloc>(
        () => _i103.ProductBatchInputBloc(gh<_i76.GetProductDetailUseCase>()));
    gh.lazySingleton<_i104.RegisterShopUseCase>(() => _i104.RegisterShopUseCase(gh<_i56.ShopRepo>()));
    gh.lazySingleton<_i105.ShopBloc>(() => _i105.ShopBloc(gh<_i104.RegisterShopUseCase>()));
    gh.lazySingleton<_i106.GetUserDetailUseCase>(() => _i106.GetUserDetailUseCase(gh<_i86.UserRepo>()));
    gh.lazySingleton<_i107.ShopProductDetailBloc>(
      () => _i107.ShopProductDetailBloc(
        gh<_i76.GetProductDetailUseCase>(),
        gh<_i70.CreateProductUseCase>(),
        gh<_i77.CreateProductImagesUseCase>(),
        gh<_i71.UpdateProductUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i108.SearchProductsBloc>(() => _i108.SearchProductsBloc(
          gh<_i73.SearchProductsUserCase>(),
          gh<_i75.GetProductsUseCase>(),
        ));
    gh.lazySingleton<_i109.SignUpBloc>(() => _i109.SignUpBloc(gh<_i55.SignUpUseCase>()));
    gh.lazySingleton<_i110.ProductInventoryBloc>(
        () => _i110.ProductInventoryBloc(gh<_i93.GetProductInventoryUseCase>()));
    gh.lazySingleton<_i111.ProductInventoryInputBloc>(
      () => _i111.ProductInventoryInputBloc(
        gh<_i75.GetProductsUseCase>(),
        gh<_i95.CreateWarehouseInputUseCase>(),
        gh<_i96.CreateProductBatchesUseCase>(),
        gh<_i94.GetWarehousesUseCase>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i112.UpsertCartItemUseCase>(() => _i112.UpsertCartItemUseCase(gh<_i79.ShoppingCartRepo>()));
    gh.lazySingleton<_i113.DeleteCartItemsUseCase>(() => _i113.DeleteCartItemsUseCase(gh<_i79.ShoppingCartRepo>()));
    gh.lazySingleton<_i114.GetShoppingCartByIdUseCase>(
        () => _i114.GetShoppingCartByIdUseCase(gh<_i79.ShoppingCartRepo>()));
    gh.lazySingleton<_i115.GetShoppingCartUseCase>(() => _i115.GetShoppingCartUseCase(gh<_i79.ShoppingCartRepo>()));
    gh.lazySingleton<_i116.ProductPropertiesInputBloc>(
        () => _i116.ProductPropertiesInputBloc(gh<_i78.GetPropertyTemplateOfCateUseCase>()));
    gh.lazySingleton<_i117.GetPaymentMethodsUseCase>(() => _i117.GetPaymentMethodsUseCase(gh<_i66.PaymentRepo>()));
    gh.lazySingleton<_i118.GetProductCateByIdUseCase>(
        () => _i118.GetProductCateByIdUseCase(gh<_i84.ProductCateRepo>()));
    gh.lazySingleton<_i119.OrderBloc>(
      () => _i119.OrderBloc(gh<_i100.CreateOrderUseCase>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i120.NotificationBloc>(() => _i120.NotificationBloc(
          gh<_i63.GetNotificationsUseCase>(),
          gh<_i64.GetNotificationOverviewUseCase>(),
        ));
    gh.lazySingleton<_i121.ShoppingCartBloc>(() => _i121.ShoppingCartBloc(
          gh<_i115.GetShoppingCartUseCase>(),
          gh<_i112.UpsertCartItemUseCase>(),
          gh<_i113.DeleteCartItemsUseCase>(),
        ));
    gh.lazySingleton<_i122.ProductCateInputBloc>(() => _i122.ProductCateInputBloc(
          gh<_i74.GetProductCatesUseCase>(),
          gh<_i118.GetProductCateByIdUseCase>(),
        ));
    gh.lazySingleton<_i123.ShopOrderBloc>(() => _i123.ShopOrderBloc(gh<_i99.GetOrdersUseCase>()));
    gh.lazySingleton<_i124.OrderProcessBloc>(() => _i124.OrderProcessBloc(
          gh<_i101.StartProcessingOrderUseCase>(),
          gh<_i102.CompleteProcessingOrderUseCase>(),
        ));
    gh.lazySingleton<_i125.UserBloc>(() => _i125.UserBloc(gh<_i106.GetUserDetailUseCase>()));
    gh.lazySingleton<_i126.PaymentMethodInpBloc>(
        () => _i126.PaymentMethodInpBloc(gh<_i117.GetPaymentMethodsUseCase>()));
    return this;
  }
}

class _$AppModuleDepedenciesProvider extends _i127.AppModuleDepedenciesProvider {}

class _$PaymentDatasourceProvider extends _i31.PaymentDatasourceProvider {}

class _$OrderDatasourceProvider extends _i32.OrderDatasourceProvider {}

class _$AuthRepoteDatasourceProvider extends _i33.AuthRepoteDatasourceProvider {}

class _$NotificationDatasourceProvider extends _i34.NotificationDatasourceProvider {}

class _$ShopRepoteDatasourceProvider extends _i35.ShopRepoteDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider extends _i36.WarehouseRemoteDatasourceProvider {}

class _$AdsDatasourceProvider extends _i37.AdsDatasourceProvider {}

class _$ProductCateDatasourceProvider extends _i38.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider extends _i39.ProductRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i40.AddressDatasourceProvider {}

class _$UserDatasourceProvider extends _i41.UserDatasourceProvider {}

class _$ShoppingCartDatasourceProvider extends _i42.ShoppingCartDatasourceProvider {}
