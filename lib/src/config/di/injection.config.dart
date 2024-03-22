// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i8;
import '../../../core/utils/storage.dart' as _i7;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i27;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i47;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i46;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i9;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i11;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i48;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i12;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i49;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i50;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i6;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i21;
import '../../features/common/data/repos/address_repo_impl.dart' as _i23;
import '../../features/common/domain/repos/address_repo.dart' as _i22;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i29;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i30;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i32;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i36;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i41;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i44;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i45;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i39;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i24;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i13;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i17;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i26;
import '../../features/product/data/repos/product_repo_impl.dart' as _i15;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i19;
import '../../features/product/domain/repos/ads_repo.dart' as _i25;
import '../../features/product/domain/repos/product_repo.dart' as _i14;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i18;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i31;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i33;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i34;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i35;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i16;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i28;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i37;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i38;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i20;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i40;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i4;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i5;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i42;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i43;
import 'injection.dart' as _i51; // ignore_for_file: unnecessary_lambdas

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
  final shoppingCartDatasourceProvider = _$ShoppingCartDatasourceProvider();
  final addressDatasourceProvider = _$AddressDatasourceProvider();
  final adsDatasourceProvider = _$AdsDatasourceProvider();
  final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
  gh.lazySingleton<_i3.OrderBloc>(() => _i3.OrderBloc());
  gh.lazySingleton<_i4.ProductOptionBloc>(() => _i4.ProductOptionBloc());
  gh.lazySingleton<_i5.ProductOptionCommunication>(
      () => _i5.ProductOptionCommunication());
  gh.lazySingleton<_i6.SignUpBloc>(() => _i6.SignUpBloc());
  await gh.lazySingletonAsync<_i7.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.ApiInterceptor>(
      () => _i8.ApiInterceptor(get<_i7.Storage>()));
  gh.lazySingleton<_i9.CheckLoginUseCase>(
      () => _i9.CheckLoginUseCase(get<_i7.Storage>()));
  gh.singleton<_i10.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i8.ApiInterceptor>()));
  gh.lazySingleton<_i11.GetRememberLoginEmailUserCase>(
      () => _i11.GetRememberLoginEmailUserCase(get<_i7.Storage>()));
  gh.lazySingleton<_i12.LogoutUseCase>(
      () => _i12.LogoutUseCase(get<_i7.Storage>()));
  gh.singleton<_i13.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i10.Dio>()));
  gh.lazySingleton<_i14.ProductRepo>(
      () => _i15.ProductRepoImpl(get<_i13.ProductRemoteDatasource>()));
  gh.lazySingleton<_i16.SearchProductsUserCase>(
      () => _i16.SearchProductsUserCase(get<_i14.ProductRepo>()));
  gh.singleton<_i17.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i10.Dio>()));
  gh.lazySingleton<_i18.ShoppingCartRepo>(
      () => _i19.ShoppingCartRepoImpl(get<_i17.ShoppingCartDatasource>()));
  gh.lazySingleton<_i20.UpsertCartItemUseCase>(
      () => _i20.UpsertCartItemUseCase(get<_i18.ShoppingCartRepo>()));
  gh.singleton<_i21.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i10.Dio>()));
  gh.lazySingleton<_i22.AddressRepo>(
      () => _i23.AddressRepoImpl(get<_i21.AddressDatasource>()));
  gh.singleton<_i24.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i10.Dio>()));
  gh.lazySingleton<_i25.AdsRepo>(
      () => _i26.AdsRepoImpl(get<_i24.AdsDatasource>()));
  gh.singleton<_i27.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i10.Dio>()));
  gh.lazySingleton<_i28.DeleteCartItemsUseCase>(
      () => _i28.DeleteCartItemsUseCase(get<_i18.ShoppingCartRepo>()));
  gh.lazySingleton<_i29.GetCommunesAndWardsUseCase>(
      () => _i29.GetCommunesAndWardsUseCase(get<_i22.AddressRepo>()));
  gh.lazySingleton<_i30.GetDistrictsUseCase>(
      () => _i30.GetDistrictsUseCase(get<_i22.AddressRepo>()));
  gh.lazySingleton<_i31.GetHomeBannersUseCase>(
      () => _i31.GetHomeBannersUseCase(get<_i25.AdsRepo>()));
  gh.lazySingleton<_i32.GetMyAddressesUseCase>(
      () => _i32.GetMyAddressesUseCase(get<_i22.AddressRepo>()));
  gh.lazySingleton<_i33.GetProductCatesUseCase>(
      () => _i33.GetProductCatesUseCase(get<_i14.ProductRepo>()));
  gh.lazySingleton<_i34.GetProductDetailUseCase>(
      () => _i34.GetProductDetailUseCase(get<_i14.ProductRepo>()));
  gh.lazySingleton<_i35.GetProductsUseCase>(
      () => _i35.GetProductsUseCase(get<_i14.ProductRepo>()));
  gh.lazySingleton<_i36.GetProvincesAndCitiesUseCase>(
      () => _i36.GetProvincesAndCitiesUseCase(get<_i22.AddressRepo>()));
  gh.lazySingleton<_i37.GetShoppingCartByIdUseCase>(
      () => _i37.GetShoppingCartByIdUseCase(get<_i18.ShoppingCartRepo>()));
  gh.lazySingleton<_i38.GetShoppingCartUseCase>(
      () => _i38.GetShoppingCartUseCase(get<_i18.ShoppingCartRepo>()));
  gh.lazySingleton<_i39.HomeBloc>(() => _i39.HomeBloc(
        get<_i35.GetProductsUseCase>(),
        get<_i33.GetProductCatesUseCase>(),
        get<_i31.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i40.ProductDetailBloc>(
      () => _i40.ProductDetailBloc(get<_i34.GetProductDetailUseCase>()));
  gh.lazySingleton<_i41.SaveMyAddressUseCase>(
      () => _i41.SaveMyAddressUseCase(get<_i22.AddressRepo>()));
  gh.lazySingleton<_i42.SearchProductsBloc>(() => _i42.SearchProductsBloc(
        get<_i16.SearchProductsUserCase>(),
        get<_i35.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i43.ShoppingCartBloc>(() => _i43.ShoppingCartBloc(
        get<_i38.GetShoppingCartUseCase>(),
        get<_i20.UpsertCartItemUseCase>(),
        get<_i28.DeleteCartItemsUseCase>(),
      ));
  gh.factory<_i44.AddressBloc>(() => _i44.AddressBloc(
        get<_i32.GetMyAddressesUseCase>(),
        get<_i36.GetProvincesAndCitiesUseCase>(),
        get<_i30.GetDistrictsUseCase>(),
        get<_i29.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i45.AddressInputBloc>(
      () => _i45.AddressInputBloc(get<_i41.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i46.AuthRepo>(
      () => _i47.AuthRepoImpl(get<_i27.AuthRepoteDatasource>()));
  gh.lazySingleton<_i48.EmailLoginUseCase>(() => _i48.EmailLoginUseCase(
        get<_i46.AuthRepo>(),
        get<_i7.Storage>(),
      ));
  gh.lazySingleton<_i49.QrBarcodeLoginUseCase>(() => _i49.QrBarcodeLoginUseCase(
        get<_i46.AuthRepo>(),
        get<_i48.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i50.LoginBloc>(() => _i50.LoginBloc(
        get<_i48.EmailLoginUseCase>(),
        get<_i49.QrBarcodeLoginUseCase>(),
        get<_i9.CheckLoginUseCase>(),
        get<_i12.LogoutUseCase>(),
        get<_i11.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i51.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i13.ProductRemoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i17.ShoppingCartDatasourceProvider {}

class _$AddressDatasourceProvider extends _i21.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i24.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i27.AuthRepoteDatasourceProvider {}
