// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i10;
import '../../../core/utils/storage.dart' as _i9;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i38;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i61;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i60;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i11;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i15;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i62;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i17;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i63;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i64;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i8;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i30;
import '../../features/common/data/data_sources/user_data_source.dart' as _i27;
import '../../features/common/data/repos/address_repo_impl.dart' as _i32;
import '../../features/common/data/repos/user_repo_impl.dart' as _i29;
import '../../features/common/domain/repos/address_repo.dart' as _i31;
import '../../features/common/domain/repos/user_repo.dart' as _i28;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i40;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i41;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i43;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i47;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i53;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i50;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i58;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i59;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i57;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i51;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i33;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i18;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i23;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i35;
import '../../features/product/data/repos/product_repo_impl.dart' as _i20;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i25;
import '../../features/product/domain/repos/ads_repo.dart' as _i34;
import '../../features/product/domain/repos/product_repo.dart' as _i19;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i24;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i42;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i44;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i45;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i46;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i21;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i39;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i48;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i49;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i26;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i52;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i4;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i5;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i54;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i56;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i22;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i37;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i36;
import '../../features/shop/domain/use_cases/check_login_usecase.dart' as _i12;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i14;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i16;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i7;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i6;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i55;
import 'injection.dart' as _i65; // ignore_for_file: unnecessary_lambdas

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
  final productRemoteDatasourceProvider = _$ProductRemoteDatasourceProvider();
  final shopRepoteDatasourceProvider = _$ShopRepoteDatasourceProvider();
  final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
  final userDatasourceProvider = _$UserDatasourceProvider();
  final addressDatasourceProvider = _$AddressDatasourceProvider();
  final adsDatasourceProvider = _$AdsDatasourceProvider();
  final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
  gh.lazySingleton<_i3.OrderBloc>(() => _i3.OrderBloc());
  gh.lazySingleton<_i4.ProductOptionBloc>(() => _i4.ProductOptionBloc());
  gh.lazySingleton<_i5.ProductOptionCommunication>(
      () => _i5.ProductOptionCommunication());
  gh.lazySingleton<_i6.ShopProductCommunication>(
      () => _i6.ShopProductCommunication());
  gh.lazySingleton<_i7.SignUpBloc>(() => _i7.SignUpBloc());
  gh.lazySingleton<_i8.SignUpBloc>(() => _i8.SignUpBloc());
  await gh.lazySingletonAsync<_i9.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i10.ApiInterceptor>(
      () => _i10.ApiInterceptor(get<_i9.Storage>()));
  gh.lazySingleton<_i11.CheckLoginUseCase>(
      () => _i11.CheckLoginUseCase(get<_i9.Storage>()));
  gh.lazySingleton<_i12.CheckLoginUseCase>(
      () => _i12.CheckLoginUseCase(get<_i9.Storage>()));
  gh.singleton<_i13.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i10.ApiInterceptor>()));
  gh.lazySingleton<_i14.GetRememberLoginEmailUserCase>(
      () => _i14.GetRememberLoginEmailUserCase(get<_i9.Storage>()));
  gh.lazySingleton<_i15.GetRememberLoginEmailUserCase>(
      () => _i15.GetRememberLoginEmailUserCase(get<_i9.Storage>()));
  gh.lazySingleton<_i16.LogoutUseCase>(
      () => _i16.LogoutUseCase(get<_i9.Storage>()));
  gh.lazySingleton<_i17.LogoutUseCase>(
      () => _i17.LogoutUseCase(get<_i9.Storage>()));
  gh.singleton<_i18.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i19.ProductRepo>(
      () => _i20.ProductRepoImpl(get<_i18.ProductRemoteDatasource>()));
  gh.lazySingleton<_i21.SearchProductsUserCase>(
      () => _i21.SearchProductsUserCase(get<_i19.ProductRepo>()));
  gh.singleton<_i22.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i13.Dio>()));
  gh.singleton<_i23.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i24.ShoppingCartRepo>(
      () => _i25.ShoppingCartRepoImpl(get<_i23.ShoppingCartDatasource>()));
  gh.lazySingleton<_i26.UpsertCartItemUseCase>(
      () => _i26.UpsertCartItemUseCase(get<_i24.ShoppingCartRepo>()));
  gh.singleton<_i27.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i28.UserRepo>(
      () => _i29.UserRepoImpl(get<_i27.UserDatasource>()));
  gh.singleton<_i30.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i31.AddressRepo>(
      () => _i32.AddressRepoImpl(get<_i30.AddressDatasource>()));
  gh.singleton<_i33.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i34.AdsRepo>(
      () => _i35.AdsRepoImpl(get<_i33.AdsDatasource>()));
  gh.lazySingleton<_i36.AuthRepo>(
      () => _i37.AuthRepoImpl(get<_i22.ShopRemoteDatasource>()));
  gh.singleton<_i38.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i39.DeleteCartItemsUseCase>(
      () => _i39.DeleteCartItemsUseCase(get<_i24.ShoppingCartRepo>()));
  gh.lazySingleton<_i40.GetCommunesAndWardsUseCase>(
      () => _i40.GetCommunesAndWardsUseCase(get<_i31.AddressRepo>()));
  gh.lazySingleton<_i41.GetDistrictsUseCase>(
      () => _i41.GetDistrictsUseCase(get<_i31.AddressRepo>()));
  gh.lazySingleton<_i42.GetHomeBannersUseCase>(
      () => _i42.GetHomeBannersUseCase(get<_i34.AdsRepo>()));
  gh.lazySingleton<_i43.GetMyAddressesUseCase>(
      () => _i43.GetMyAddressesUseCase(get<_i31.AddressRepo>()));
  gh.lazySingleton<_i44.GetProductCatesUseCase>(
      () => _i44.GetProductCatesUseCase(get<_i19.ProductRepo>()));
  gh.lazySingleton<_i45.GetProductDetailUseCase>(
      () => _i45.GetProductDetailUseCase(get<_i19.ProductRepo>()));
  gh.lazySingleton<_i46.GetProductsUseCase>(
      () => _i46.GetProductsUseCase(get<_i19.ProductRepo>()));
  gh.lazySingleton<_i47.GetProvincesAndCitiesUseCase>(
      () => _i47.GetProvincesAndCitiesUseCase(get<_i31.AddressRepo>()));
  gh.lazySingleton<_i48.GetShoppingCartByIdUseCase>(
      () => _i48.GetShoppingCartByIdUseCase(get<_i24.ShoppingCartRepo>()));
  gh.lazySingleton<_i49.GetShoppingCartUseCase>(
      () => _i49.GetShoppingCartUseCase(get<_i24.ShoppingCartRepo>()));
  gh.lazySingleton<_i50.GetUserDetailUseCase>(
      () => _i50.GetUserDetailUseCase(get<_i28.UserRepo>()));
  gh.lazySingleton<_i51.HomeBloc>(() => _i51.HomeBloc(
        get<_i46.GetProductsUseCase>(),
        get<_i44.GetProductCatesUseCase>(),
        get<_i42.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i52.ProductDetailBloc>(
      () => _i52.ProductDetailBloc(get<_i45.GetProductDetailUseCase>()));
  gh.lazySingleton<_i53.SaveMyAddressUseCase>(
      () => _i53.SaveMyAddressUseCase(get<_i31.AddressRepo>()));
  gh.lazySingleton<_i54.SearchProductsBloc>(() => _i54.SearchProductsBloc(
        get<_i21.SearchProductsUserCase>(),
        get<_i46.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i55.ShopProductBloc>(() => _i55.ShopProductBloc(
        get<_i46.GetProductsUseCase>(),
        get<_i44.GetProductCatesUseCase>(),
        get<_i42.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i56.ShoppingCartBloc>(() => _i56.ShoppingCartBloc(
        get<_i49.GetShoppingCartUseCase>(),
        get<_i26.UpsertCartItemUseCase>(),
        get<_i39.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i57.UserBloc>(
      () => _i57.UserBloc(get<_i50.GetUserDetailUseCase>()));
  gh.factory<_i58.AddressBloc>(() => _i58.AddressBloc(
        get<_i43.GetMyAddressesUseCase>(),
        get<_i47.GetProvincesAndCitiesUseCase>(),
        get<_i41.GetDistrictsUseCase>(),
        get<_i40.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i59.AddressInputBloc>(
      () => _i59.AddressInputBloc(get<_i53.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i60.AuthRepo>(
      () => _i61.AuthRepoImpl(get<_i38.AuthRepoteDatasource>()));
  gh.lazySingleton<_i62.EmailLoginUseCase>(() => _i62.EmailLoginUseCase(
        get<_i60.AuthRepo>(),
        get<_i9.Storage>(),
      ));
  gh.lazySingleton<_i63.QrBarcodeLoginUseCase>(() => _i63.QrBarcodeLoginUseCase(
        get<_i60.AuthRepo>(),
        get<_i62.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i64.LoginBloc>(() => _i64.LoginBloc(
        get<_i62.EmailLoginUseCase>(),
        get<_i63.QrBarcodeLoginUseCase>(),
        get<_i11.CheckLoginUseCase>(),
        get<_i17.LogoutUseCase>(),
        get<_i15.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i65.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i18.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i22.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i23.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i27.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i30.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i33.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i38.AuthRepoteDatasourceProvider {}
