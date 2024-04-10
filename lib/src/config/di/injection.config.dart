// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i12;
import '../../../core/utils/storage.dart' as _i11;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i47;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i85;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i84;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i13;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i15;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i86;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i17;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i87;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i88;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i89;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i90;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i41;
import '../../features/common/data/data_sources/user_data_source.dart' as _i35;
import '../../features/common/data/repos/address_repo_impl.dart' as _i43;
import '../../features/common/data/repos/user_repo_impl.dart' as _i37;
import '../../features/common/domain/repos/address_repo.dart' as _i42;
import '../../features/common/domain/repos/user_repo.dart' as _i36;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i52;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i53;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i55;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i62;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i75;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i65;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i19;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i4;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i82;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i83;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i81;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i66;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i3;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i44;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i20;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i23;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i46;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i22;
import '../../features/product/data/repos/product_repo_impl.dart' as _i25;
import '../../features/product/domain/repos/ads_repo.dart' as _i45;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i21;
import '../../features/product/domain/repos/product_repo.dart' as _i24;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i61;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i54;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i48;
import '../../features/product/domain/use_cases/product/create_product_usecase.dart'
    as _i49;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i51;
import '../../features/product/domain/use_cases/product/get_product_cate_by_id_usecase.dart'
    as _i56;
import '../../features/product/domain/use_cases/product/get_product_cates_usecase.dart'
    as _i57;
import '../../features/product/domain/use_cases/product/get_product_detail_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/product/get_products_usecase.dart'
    as _i60;
import '../../features/product/domain/use_cases/product/search_products_usecase.dart'
    as _i26;
import '../../features/product/domain/use_cases/product/update_product_usecase.dart'
    as _i33;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i70;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i6;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i7;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i76;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i27;
import '../../features/shop/data/data_sources/warehouse_data_source.dart'
    as _i38;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i29;
import '../../features/shop/data/repositories/warehouse_repo_impl.dart' as _i40;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i28;
import '../../features/shop/domain/repositories/warehouse_repo.dart' as _i39;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i16;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i18;
import '../../features/shop/domain/use_cases/product_inventory/get_product_inventory_usecase.dart'
    as _i59;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i74;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i69;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_bloc.dart'
    as _i71;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_batch_input/product_batch_input_bloc.dart'
    as _i68;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart'
    as _i72;
import '../../features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_communicaton.dart'
    as _i5;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i8;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i73;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i77;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i9;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i78;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i79;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i10;
import '../../features/shopping_cart/data/data_sources/shopping_cart_data_soruce.dart'
    as _i30;
import '../../features/shopping_cart/data/repos/shopping_cart_repo_impl.dart'
    as _i32;
import '../../features/shopping_cart/domain/repos/shopping_cart_repo.dart'
    as _i31;
import '../../features/shopping_cart/domain/use_cases/delete_cart_items_usecase.dart'
    as _i50;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_by_id_usecase.dart'
    as _i63;
import '../../features/shopping_cart/domain/use_cases/get_shopping_cart_usecase.dart'
    as _i64;
import '../../features/shopping_cart/domain/use_cases/upsert_cart_item_usecase.dart'
    as _i34;
import '../../features/shopping_cart/presentation/bloc/shopping_cart_bloc.dart'
    as _i80;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i67;
import 'injection.dart' as _i91; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.OrderBloc>(() => _i3.OrderBloc());
  gh.lazySingleton<_i4.PickLocalImageUseCase>(
      () => _i4.PickLocalImageUseCase());
  gh.lazySingleton<_i5.ProductInventoryInputCommunication>(
      () => _i5.ProductInventoryInputCommunication());
  gh.lazySingleton<_i6.ProductOptionBloc>(() => _i6.ProductOptionBloc());
  gh.lazySingleton<_i7.ProductOptionCommunication>(
      () => _i7.ProductOptionCommunication());
  gh.lazySingleton<_i8.ProductOptionsInputBloc>(
      () => _i8.ProductOptionsInputBloc());
  gh.lazySingleton<_i9.ShopProductCommunication>(
      () => _i9.ShopProductCommunication());
  gh.lazySingleton<_i10.ShopProductDetailCommunication>(
      () => _i10.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i11.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i12.ApiInterceptor>(
      () => _i12.ApiInterceptor(get<_i11.Storage>()));
  gh.lazySingleton<_i13.CheckLoginUseCase>(
      () => _i13.CheckLoginUseCase(get<_i11.Storage>()));
  gh.singleton<_i14.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i12.ApiInterceptor>()));
  gh.lazySingleton<_i15.GetRememberLoginEmailUserCase>(
      () => _i15.GetRememberLoginEmailUserCase(get<_i11.Storage>()));
  gh.lazySingleton<_i16.GetRememberLoginEmailUserCase>(
      () => _i16.GetRememberLoginEmailUserCase(get<_i11.Storage>()));
  gh.lazySingleton<_i17.LogoutUseCase>(
      () => _i17.LogoutUseCase(get<_i11.Storage>()));
  gh.lazySingleton<_i18.LogoutUseCase>(
      () => _i18.LogoutUseCase(get<_i11.Storage>()));
  gh.lazySingleton<_i19.PickLocalImageAsBase64UseCase>(() =>
      _i19.PickLocalImageAsBase64UseCase(get<_i4.PickLocalImageUseCase>()));
  gh.singleton<_i20.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i21.ProductCateRepo>(
      () => _i22.ProductRepoImpl(get<_i20.ProductCateDatasource>()));
  gh.singleton<_i23.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i24.ProductRepo>(
      () => _i25.ProductRepoImpl(get<_i23.ProductRemoteDatasource>()));
  gh.lazySingleton<_i26.SearchProductsUserCase>(
      () => _i26.SearchProductsUserCase(get<_i24.ProductRepo>()));
  gh.singleton<_i27.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i28.ShopRepo>(
      () => _i29.ShopRepoImpl(get<_i27.ShopRemoteDatasource>()));
  gh.singleton<_i30.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i31.ShoppingCartRepo>(
      () => _i32.ShoppingCartRepoImpl(get<_i30.ShoppingCartDatasource>()));
  gh.lazySingleton<_i33.UpdateProductUseCase>(
      () => _i33.UpdateProductUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i34.UpsertCartItemUseCase>(
      () => _i34.UpsertCartItemUseCase(get<_i31.ShoppingCartRepo>()));
  gh.singleton<_i35.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i36.UserRepo>(
      () => _i37.UserRepoImpl(get<_i35.UserDatasource>()));
  gh.singleton<_i38.WarehouseRemoteDatasource>(warehouseRemoteDatasourceProvider
      .provideWarehouseRemoteDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i39.WarehouseRepo>(
      () => _i40.WarehouseRepoImpl(get<_i38.WarehouseRemoteDatasource>()));
  gh.singleton<_i41.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i42.AddressRepo>(
      () => _i43.AddressRepoImpl(get<_i41.AddressDatasource>()));
  gh.singleton<_i44.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i45.AdsRepo>(
      () => _i46.AdsRepoImpl(get<_i44.AdsDatasource>()));
  gh.singleton<_i47.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i14.Dio>()));
  gh.lazySingleton<_i48.CreateProductImagesUseCase>(
      () => _i48.CreateProductImagesUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i49.CreateProductUseCase>(
      () => _i49.CreateProductUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i50.DeleteCartItemsUseCase>(
      () => _i50.DeleteCartItemsUseCase(get<_i31.ShoppingCartRepo>()));
  gh.lazySingleton<_i51.DeleteProductUseCase>(
      () => _i51.DeleteProductUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i52.GetCommunesAndWardsUseCase>(
      () => _i52.GetCommunesAndWardsUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i53.GetDistrictsUseCase>(
      () => _i53.GetDistrictsUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i54.GetHomeBannersUseCase>(
      () => _i54.GetHomeBannersUseCase(get<_i45.AdsRepo>()));
  gh.lazySingleton<_i55.GetMyAddressesUseCase>(
      () => _i55.GetMyAddressesUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i56.GetProductCateByIdUseCase>(
      () => _i56.GetProductCateByIdUseCase(get<_i21.ProductCateRepo>()));
  gh.lazySingleton<_i57.GetProductCatesUseCase>(
      () => _i57.GetProductCatesUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i58.GetProductDetailUseCase>(
      () => _i58.GetProductDetailUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i59.GetProductInventoryUseCase>(
      () => _i59.GetProductInventoryUseCase(get<_i39.WarehouseRepo>()));
  gh.lazySingleton<_i60.GetProductsUseCase>(
      () => _i60.GetProductsUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i61.GetPropertyTemplateOfCateUseCase>(
      () => _i61.GetPropertyTemplateOfCateUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i62.GetProvincesAndCitiesUseCase>(
      () => _i62.GetProvincesAndCitiesUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i63.GetShoppingCartByIdUseCase>(
      () => _i63.GetShoppingCartByIdUseCase(get<_i31.ShoppingCartRepo>()));
  gh.lazySingleton<_i64.GetShoppingCartUseCase>(
      () => _i64.GetShoppingCartUseCase(get<_i31.ShoppingCartRepo>()));
  gh.lazySingleton<_i65.GetUserDetailUseCase>(
      () => _i65.GetUserDetailUseCase(get<_i36.UserRepo>()));
  gh.lazySingleton<_i66.HomeBloc>(() => _i66.HomeBloc(
        get<_i60.GetProductsUseCase>(),
        get<_i57.GetProductCatesUseCase>(),
        get<_i54.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i67.ImageInputBloc>(
      () => _i67.ImageInputBloc(get<_i19.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i68.ProductBatchInputBloc>(
      () => _i68.ProductBatchInputBloc(get<_i58.GetProductDetailUseCase>()));
  gh.lazySingleton<_i69.ProductCateInputBloc>(() => _i69.ProductCateInputBloc(
        get<_i57.GetProductCatesUseCase>(),
        get<_i56.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i70.ProductDetailBloc>(
      () => _i70.ProductDetailBloc(get<_i58.GetProductDetailUseCase>()));
  gh.lazySingleton<_i71.ProductInventoryBloc>(
      () => _i71.ProductInventoryBloc(get<_i59.GetProductInventoryUseCase>()));
  gh.lazySingleton<_i72.ProductInventoryInputBloc>(
    () => _i72.ProductInventoryInputBloc(get<_i60.GetProductsUseCase>()),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i73.ProductPropertiesInputBloc>(() =>
      _i73.ProductPropertiesInputBloc(
          get<_i61.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i74.RegisterShopUseCase>(
      () => _i74.RegisterShopUseCase(get<_i28.ShopRepo>()));
  gh.lazySingleton<_i75.SaveMyAddressUseCase>(
      () => _i75.SaveMyAddressUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i76.SearchProductsBloc>(() => _i76.SearchProductsBloc(
        get<_i26.SearchProductsUserCase>(),
        get<_i60.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i77.ShopBloc>(
      () => _i77.ShopBloc(get<_i74.RegisterShopUseCase>()));
  gh.lazySingleton<_i78.ShopProductBloc>(() => _i78.ShopProductBloc(
        get<_i60.GetProductsUseCase>(),
        get<_i57.GetProductCatesUseCase>(),
        get<_i54.GetHomeBannersUseCase>(),
        get<_i51.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i79.ShopProductDetailBloc>(
    () => _i79.ShopProductDetailBloc(
      get<_i58.GetProductDetailUseCase>(),
      get<_i49.CreateProductUseCase>(),
      get<_i48.CreateProductImagesUseCase>(),
      get<_i33.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i80.ShoppingCartBloc>(() => _i80.ShoppingCartBloc(
        get<_i64.GetShoppingCartUseCase>(),
        get<_i34.UpsertCartItemUseCase>(),
        get<_i50.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i81.UserBloc>(
      () => _i81.UserBloc(get<_i65.GetUserDetailUseCase>()));
  gh.factory<_i82.AddressBloc>(() => _i82.AddressBloc(
        get<_i55.GetMyAddressesUseCase>(),
        get<_i62.GetProvincesAndCitiesUseCase>(),
        get<_i53.GetDistrictsUseCase>(),
        get<_i52.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i83.AddressInputBloc>(
      () => _i83.AddressInputBloc(get<_i75.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i84.AuthRepo>(
      () => _i85.AuthRepoImpl(get<_i47.AuthRepoteDatasource>()));
  gh.lazySingleton<_i86.EmailLoginUseCase>(() => _i86.EmailLoginUseCase(
        get<_i84.AuthRepo>(),
        get<_i11.Storage>(),
      ));
  gh.lazySingleton<_i87.QrBarcodeLoginUseCase>(() => _i87.QrBarcodeLoginUseCase(
        get<_i84.AuthRepo>(),
        get<_i86.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i88.SignUpUseCase>(
      () => _i88.SignUpUseCase(get<_i84.AuthRepo>()));
  gh.lazySingleton<_i89.LoginBloc>(() => _i89.LoginBloc(
        get<_i86.EmailLoginUseCase>(),
        get<_i87.QrBarcodeLoginUseCase>(),
        get<_i13.CheckLoginUseCase>(),
        get<_i17.LogoutUseCase>(),
        get<_i15.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i90.SignUpBloc>(
      () => _i90.SignUpBloc(get<_i88.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i91.AppModuleDepedenciesProvider {}

class _$ProductCateDatasourceProvider
    extends _i20.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i23.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i27.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i30.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i35.UserDatasourceProvider {}

class _$WarehouseRemoteDatasourceProvider
    extends _i38.WarehouseRemoteDatasourceProvider {}

class _$AddressDatasourceProvider extends _i41.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i44.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i47.AuthRepoteDatasourceProvider {}
