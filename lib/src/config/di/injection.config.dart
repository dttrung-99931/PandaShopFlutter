// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i15;
import '../../../core/interceptors/pagination_interceptor.dart' as _i6;
import '../../../core/utils/storage.dart' as _i14;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i61;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i113;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i112;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i19;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i114;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i21;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i115;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i116;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i117;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i118;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i55;
import '../../features/common/data/data_sources/user_data_source.dart' as _i49;
import '../../features/common/data/repos/address_repo_impl.dart' as _i57;
import '../../features/common/data/repos/user_repo_impl.dart' as _i51;
import '../../features/common/domain/repos/address_repo.dart' as _i56;
import '../../features/common/domain/repos/user_repo.dart' as _i50;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i70;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i71;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i73;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i84;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i102;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i87;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i32;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i7;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i110;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i111;
import '../../features/common/presentation/bloc/main/main_bloc.dart' as _i22;
import '../../features/common/presentation/bloc/main/main_bloc_communicaton.dart'
    as _i4;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i109;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i89;
import '../../features/notification/data/data_sources/notification_data_source.dart'
    as _i23;
import '../../features/notification/data/repos/notification_repo_impl.dart'
    as _i25;
import '../../features/notification/domain/repos/notification_repo.dart'
    as _i24;
import '../../features/notification/domain/use_cases/get_notifications_overview_usecase.dart'
    as _i74;
import '../../features/notification/domain/use_cases/get_notifications_usecase.dart'
    as _i75;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i91;
import '../../features/order/data/data_sources/order_data_source.dart' as _i26;
import '../../features/order/data/data_sources/payment_data_soruce.dart'
    as _i29;
import '../../features/order/data/repos/order_repo_impl.dart' as _i28;
import '../../features/order/data/repos/payment_repo_impl.dart' as _i31;
import '../../features/order/domain/repos/order_repo.dart' as _i27;
import '../../features/order/domain/repos/payment_repo.dart' as _i30;
import '../../features/order/domain/use_cases/create_order_usecase.dart'
    as _i63;
import '../../features/order/domain/use_cases/get_orders_usecase.dart' as _i76;
import '../../features/order/domain/use_cases/get_payment_methods_usecase.dart'
    as _i77;
import '../../features/order/presentation/bloc/delivery_method_inp/delivery_method_inp_bloc.dart'
    as _i3;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i92;
import '../../features/order/presentation/bloc/order_bloc_communicaton.dart'
    as _i5;
import '../../features/order/presentation/bloc/payment_method_inp/payment_method_inp_bloc.dart'
    as _i94;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i58;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i33;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i36;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i60;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i35;
import '../../features/product/data/repos/product_repo_impl.dart' as _i38;
import '../../features/product/domain/repos/ads_repo.dart' as _i59;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i34;
import '../../features/product/domain/repos/product_repo.dart' as _i37;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i83;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i72;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i65;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i66;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i69;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i78;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i79;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i80;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i82;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i39;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i47;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i97;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i9;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i10;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i103;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i40;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i52;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i42;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i54;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i41;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i53;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i18;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/shop/domain/use_cases/product_inventory/create_product_batches_usecase.dart'
    as _i64;
import '../../features/shop/domain/use_cases/product_inventory/create_warehouse_input_usecase.dart'
    as _i67;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i81;
import '../../features/shop/domain/use_cases/product_inventory/get_warehouses_usecase.dart'
    as _i88;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i101;
import '../../features/shop/domain/use_cases/shop_order/order_process/complete_processing_order_usecase.dart'
    as _i62;
import '../../features/shop/domain/use_cases/shop_order/order_process/start_processing_order_usecase.dart'
    as _i46;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i96;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i98;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i95;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i99;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i11;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i100;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i104;
import '../../features/shop/presentation/bloc/shop_order/order_process/order_process_bloc.dart'
    as _i93;
import '../../features/shop/presentation/bloc/shop_order/shop_order_bloc.dart'
    as _i105;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i12;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i106;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i107;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i13;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i43;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i45;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i44;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i68;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i85;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i86;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i48;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i108;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i90;
import 'injection.dart' as _i119; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.ShopProductCommunication>(
      () => _i12.ShopProductCommunication());
  gh.lazySingleton<_i13.ShopProductDetailCommunication>(
      () => _i13.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i14.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i15.ApiInterceptor>(
      () => _i15.ApiInterceptor(get<_i14.Storage>()));
  gh.lazySingleton<_i16.CheckLoginUseCase>(
      () => _i16.CheckLoginUseCase(get<_i14.Storage>()));
  gh.singleton<_i17.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i15.ApiInterceptor>()));
  gh.lazySingleton<_i18.GetRememberLoginEmailUserCase>(
      () => _i18.GetRememberLoginEmailUserCase(get<_i14.Storage>()));
  gh.lazySingleton<_i19.GetRememberLoginEmailUserCase>(
      () => _i19.GetRememberLoginEmailUserCase(get<_i14.Storage>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(get<_i14.Storage>()));
  gh.lazySingleton<_i21.LogoutUseCase>(
      () => _i21.LogoutUseCase(get<_i14.Storage>()));
  gh.lazySingleton<_i22.MainBloc>(() => _i22.MainBloc(get<_i14.Storage>()));
  gh.singleton<_i23.NotificationDatasource>(notificationDatasourceProvider
      .provideNotificationDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i24.NotificationRepo>(
      () => _i25.NotificationRepoImpl(get<_i23.NotificationDatasource>()));
  gh.singleton<_i26.OrderDatasource>(
      orderDatasourceProvider.provideOrderDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i27.OrderRepo>(
      () => _i28.OrderRepoImpl(get<_i26.OrderDatasource>()));
  gh.singleton<_i29.PaymentDatasource>(
      paymentDatasourceProvider.providePaymentDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i30.PaymentRepo>(
      () => _i31.PaymentRepoImpl(get<_i29.PaymentDatasource>()));
  gh.lazySingleton<_i32.PickLocalImageAsBase64UseCase>(() =>
      _i32.PickLocalImageAsBase64UseCase(get<_i7.PickLocalImageUseCase>()));
  gh.singleton<_i33.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i34.ProductCateRepo>(
      () => _i35.ProductRepoImpl(get<_i33.ProductCateDatasource>()));
  gh.singleton<_i36.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i37.ProductRepo>(
      () => _i38.ProductRepoImpl(get<_i36.ProductRemoteDatasource>()));
  gh.lazySingleton<_i39.SearchProductsUserCase>(
      () => _i39.SearchProductsUserCase(get<_i37.ProductRepo>()));
  gh.singleton<_i40.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i41.ShopRepo>(
      () => _i42.ShopRepoImpl(get<_i40.ShopRemoteDatasource>()));
  gh.singleton<_i43.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i44.ShoppingCartRepo>(
      () => _i45.ShoppingCartRepoImpl(get<_i43.ShoppingCartDatasource>()));
  gh.lazySingleton<_i46.StartProcessingOrderUseCase>(
      () => _i46.StartProcessingOrderUseCase(get<_i27.OrderRepo>()));
  gh.lazySingleton<_i47.UpdateProductUseCase>(
      () => _i47.UpdateProductUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i48.UpsertCartItemUseCase>(
      () => _i48.UpsertCartItemUseCase(get<_i44.ShoppingCartRepo>()));
  gh.singleton<_i49.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i50.UserRepo>(
      () => _i51.UserRepoImpl(get<_i49.UserDatasource>()));
  gh.singleton<_i52.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i53.WarehouseRepo>(
      () => _i54.WarehouseRepoImpl(get<_i52.WarehouseRemoteDatasource>()));
  gh.singleton<_i55.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i56.AddressRepo>(
      () => _i57.AddressRepoImpl(get<_i55.AddressDatasource>()));
  gh.singleton<_i58.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i59.AdsRepo>(
      () => _i60.AdsRepoImpl(get<_i58.AdsDatasource>()));
  gh.singleton<_i61.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i62.CompleteProcessingOrderUseCase>(
      () => _i62.CompleteProcessingOrderUseCase(get<_i27.OrderRepo>()));
  gh.lazySingleton<_i63.CreateOrderUseCase>(
      () => _i63.CreateOrderUseCase(get<_i27.OrderRepo>()));
  gh.lazySingleton<_i64.CreateProductBatchesUseCase>(
      () => _i64.CreateProductBatchesUseCase(get<_i53.WarehouseRepo>()));
  gh.lazySingleton<_i65.CreateProductImagesUseCase>(
      () => _i65.CreateProductImagesUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i66.CreateProductUseCase>(
      () => _i66.CreateProductUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i67.CreateWarehouseInputUseCase>(
      () => _i67.CreateWarehouseInputUseCase(get<_i53.WarehouseRepo>()));
  gh.lazySingleton<_i68.DeleteCartItemsUseCase>(
      () => _i68.DeleteCartItemsUseCase(get<_i44.ShoppingCartRepo>()));
  gh.lazySingleton<_i69.DeleteProductUseCase>(
      () => _i69.DeleteProductUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i70.GetCommunesAndWardsUseCase>(
      () => _i70.GetCommunesAndWardsUseCase(get<_i56.AddressRepo>()));
  gh.lazySingleton<_i71.GetDistrictsUseCase>(
      () => _i71.GetDistrictsUseCase(get<_i56.AddressRepo>()));
  gh.lazySingleton<_i72.GetHomeBannersUseCase>(
      () => _i72.GetHomeBannersUseCase(get<_i59.AdsRepo>()));
  gh.lazySingleton<_i73.GetMyAddressesUseCase>(
      () => _i73.GetMyAddressesUseCase(get<_i56.AddressRepo>()));
  gh.lazySingleton<_i74.GetNotificationOverviewUseCase>(
      () => _i74.GetNotificationOverviewUseCase(get<_i24.NotificationRepo>()));
  gh.lazySingleton<_i75.GetNotificationsUseCase>(
      () => _i75.GetNotificationsUseCase(get<_i24.NotificationRepo>()));
  gh.lazySingleton<_i76.GetOrdersUseCase>(
      () => _i76.GetOrdersUseCase(get<_i27.OrderRepo>()));
  gh.lazySingleton<_i77.GetPaymentMethodsUseCase>(
      () => _i77.GetPaymentMethodsUseCase(get<_i30.PaymentRepo>()));
  gh.lazySingleton<_i78.GetProductCateByIdUseCase>(
      () => _i78.GetProductCateByIdUseCase(get<_i34.ProductCateRepo>()));
  gh.lazySingleton<_i79.GetProductCatesUseCase>(
      () => _i79.GetProductCatesUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i80.GetProductDetailUseCase>(
      () => _i80.GetProductDetailUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i81.GetProductInventoryUseCase>(
      () => _i81.GetProductInventoryUseCase(get<_i53.WarehouseRepo>()));
  gh.lazySingleton<_i82.GetProductsUseCase>(
      () => _i82.GetProductsUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i83.GetPropertyTemplateOfCateUseCase>(
      () => _i83.GetPropertyTemplateOfCateUseCase(get<_i37.ProductRepo>()));
  gh.lazySingleton<_i84.GetProvincesAndCitiesUseCase>(
      () => _i84.GetProvincesAndCitiesUseCase(get<_i56.AddressRepo>()));
  gh.lazySingleton<_i85.GetShoppingCartByIdUseCase>(
      () => _i85.GetShoppingCartByIdUseCase(get<_i44.ShoppingCartRepo>()));
  gh.lazySingleton<_i86.GetShoppingCartUseCase>(
      () => _i86.GetShoppingCartUseCase(get<_i44.ShoppingCartRepo>()));
  gh.lazySingleton<_i87.GetUserDetailUseCase>(
      () => _i87.GetUserDetailUseCase(get<_i50.UserRepo>()));
  gh.lazySingleton<_i88.GetWarehousesUseCase>(
      () => _i88.GetWarehousesUseCase(get<_i53.WarehouseRepo>()));
  gh.lazySingleton<_i89.HomeBloc>(() => _i89.HomeBloc(
        get<_i82.GetProductsUseCase>(),
        get<_i79.GetProductCatesUseCase>(),
        get<_i72.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i90.ImageInputBloc>(
      () => _i90.ImageInputBloc(get<_i32.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i91.NotificationBloc>(() => _i91.NotificationBloc(
        get<_i75.GetNotificationsUseCase>(),
        get<_i74.GetNotificationOverviewUseCase>(),
      ));
  gh.lazySingleton<_i92.OrderBloc>(
    () => _i92.OrderBloc(get<_i63.CreateOrderUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i93.OrderProcessBloc>(() => _i93.OrderProcessBloc(
        get<_i46.StartProcessingOrderUseCase>(),
        get<_i62.CompleteProcessingOrderUseCase>(),
      ));
  gh.lazySingleton<_i94.PaymentMethodInpBloc>(
      () => _i94.PaymentMethodInpBloc(get<_i77.GetPaymentMethodsUseCase>()));
  gh.lazySingleton<_i95.ProductBatchInputBloc>(
      () => _i95.ProductBatchInputBloc(get<_i80.GetProductDetailUseCase>()));
  gh.lazySingleton<_i96.ProductCateInputBloc>(() => _i96.ProductCateInputBloc(
        get<_i79.GetProductCatesUseCase>(),
        get<_i78.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i97.ProductDetailBloc>(
      () => _i97.ProductDetailBloc(get<_i80.GetProductDetailUseCase>()));
  gh.lazySingleton<_i98.ProductInventoryBloc>(
      () => _i98.ProductInventoryBloc(get<_i81.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i99.ProductInventoryInputBloc>(
    () => _i99.ProductInventoryInputBloc(
      get<_i82.GetProductsUseCase>(),
      get<_i67.CreateWarehouseInputUseCase>(),
      get<_i64.CreateProductBatchesUseCase>(),
      get<_i88.GetWarehousesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i100.ProductPropertiesInputBloc>(() =>
      _i100.ProductPropertiesInputBloc(
          get<_i83.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i101.RegisterShopUseCase>(
      () => _i101.RegisterShopUseCase(get<_i41.ShopRepo>()));
  gh.lazySingleton<_i102.SaveMyAddressUseCase>(
      () => _i102.SaveMyAddressUseCase(get<_i56.AddressRepo>()));
  gh.lazySingleton<_i103.SearchProductsBloc>(() => _i103.SearchProductsBloc(
        get<_i39.SearchProductsUserCase>(),
        get<_i82.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i104.ShopBloc>(
      () => _i104.ShopBloc(get<_i101.RegisterShopUseCase>()));
  gh.lazySingleton<_i105.ShopOrderBloc>(
      () => _i105.ShopOrderBloc(get<_i76.GetOrdersUseCase>()));
  gh.lazySingleton<_i106.ShopProductBloc>(() => _i106.ShopProductBloc(
        get<_i82.GetProductsUseCase>(),
        get<_i79.GetProductCatesUseCase>(),
        get<_i72.GetHomeBannersUseCase>(),
        get<_i69.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i107.ShopProductDetailBloc>(
    () => _i107.ShopProductDetailBloc(
      get<_i80.GetProductDetailUseCase>(),
      get<_i66.CreateProductUseCase>(),
      get<_i65.CreateProductImagesUseCase>(),
      get<_i47.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i108.ShoppingCartBloc>(() => _i108.ShoppingCartBloc(
        get<_i86.GetShoppingCartUseCase>(),
        get<_i48.UpsertCartItemUseCase>(),
        get<_i68.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i109.UserBloc>(
      () => _i109.UserBloc(get<_i87.GetUserDetailUseCase>()));
  gh.factory<_i110.AddressBloc>(() => _i110.AddressBloc(
        get<_i73.GetMyAddressesUseCase>(),
        get<_i84.GetProvincesAndCitiesUseCase>(),
        get<_i71.GetDistrictsUseCase>(),
        get<_i70.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i111.AddressInputBloc>(
      () => _i111.AddressInputBloc(get<_i102.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i112.AuthRepo>(
      () => _i113.AuthRepoImpl(get<_i61.AuthRepoteDatasource>()));
  gh.lazySingleton<_i114.EmailLoginUseCase>(() => _i114.EmailLoginUseCase(
        get<_i112.AuthRepo>(),
        get<_i14.Storage>(),
      ));
  gh.lazySingleton<_i115.QrBarcodeLoginUseCase>(
      () => _i115.QrBarcodeLoginUseCase(
            get<_i112.AuthRepo>(),
            get<_i114.EmailLoginUseCase>(),
          ));
  gh.lazySingleton<_i116.SignUpUseCase>(
      () => _i116.SignUpUseCase(get<_i112.AuthRepo>()));
  gh.lazySingleton<_i117.LoginBloc>(() => _i117.LoginBloc(
        get<_i114.EmailLoginUseCase>(),
        get<_i115.QrBarcodeLoginUseCase>(),
        get<_i16.CheckLoginUseCase>(),
        get<_i21.LogoutUseCase>(),
        get<_i19.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i118.SignUpBloc>(
      () => _i118.SignUpBloc(get<_i116.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i119.AppModuleDepedenciesProvider {}

class _$NotificationDatasourceProvider
    extends _i23.NotificationDatasourceProvider {}

class _$OrderDatasourceProvider extends _i26.OrderDatasourceProvider {}

class _$PaymentDatasourceProvider extends _i29.PaymentDatasourceProvider {}

class _$ProductCateDatasourceProvider
    extends _i33.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i36.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i40.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i43.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i49.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i52.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i55.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i58.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i61.AuthRepoteDatasourceProvider {}
