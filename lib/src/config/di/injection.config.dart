// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i13;
import '../../../core/utils/storage.dart' as _i12;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i41;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i65;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i64;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i17;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i66;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i67;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i68;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i10;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i33;
import '../../features/common/data/data_sources/user_data_source.dart' as _i30;
import '../../features/common/data/repos/address_repo_impl.dart' as _i35;
import '../../features/common/data/repos/user_repo_impl.dart' as _i32;
import '../../features/common/domain/repos/address_repo.dart' as _i34;
import '../../features/common/domain/repos/user_repo.dart' as _i31;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i43;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i44;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i46;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i50;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i56;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i53;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i62;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i63;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i61;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i54;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i36;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i21;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i26;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i38;
import '../../features/product/data/repos/product_repo_impl.dart' as _i23;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i28;
import '../../features/product/domain/repos/ads_repo.dart' as _i37;
import '../../features/product/domain/repos/product_repo.dart' as _i22;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i27;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i45;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i47;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i48;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i49;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i24;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i42;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i51;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i52;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i29;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i4;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i55;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i5;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i7;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i57;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i60;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i25;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i40;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i39;
import '../../features/shop/domain/use_cases/check_login_usecase.dart' as _i14;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i18;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i11;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i9;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i58;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc.dart'
    as _i6;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i59;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i3;
import 'injection.dart' as _i69; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.ImageInputBloc>(() => _i3.ImageInputBloc());
  gh.lazySingleton<_i4.OrderBloc>(() => _i4.OrderBloc());
  gh.lazySingleton<_i5.ProductOptionBloc>(() => _i5.ProductOptionBloc());
  gh.lazySingleton<_i6.ProductOptionBloc>(() => _i6.ProductOptionBloc());
  gh.lazySingleton<_i7.ProductOptionCommunication>(
      () => _i7.ProductOptionCommunication());
  gh.lazySingleton<_i8.ProductOptionCommunication>(
      () => _i8.ProductOptionCommunication());
  gh.lazySingleton<_i9.ShopProductCommunication>(
      () => _i9.ShopProductCommunication());
  gh.lazySingleton<_i10.SignUpBloc>(() => _i10.SignUpBloc());
  gh.lazySingleton<_i11.SignUpBloc>(() => _i11.SignUpBloc());
  await gh.lazySingletonAsync<_i12.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i13.ApiInterceptor>(
      () => _i13.ApiInterceptor(get<_i12.Storage>()));
  gh.lazySingleton<_i14.CheckLoginUseCase>(
      () => _i14.CheckLoginUseCase(get<_i12.Storage>()));
  gh.lazySingleton<_i15.CheckLoginUseCase>(
      () => _i15.CheckLoginUseCase(get<_i12.Storage>()));
  gh.singleton<_i16.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i13.ApiInterceptor>()));
  gh.lazySingleton<_i17.GetRememberLoginEmailUserCase>(
      () => _i17.GetRememberLoginEmailUserCase(get<_i12.Storage>()));
  gh.lazySingleton<_i18.GetRememberLoginEmailUserCase>(
      () => _i18.GetRememberLoginEmailUserCase(get<_i12.Storage>()));
  gh.lazySingleton<_i19.LogoutUseCase>(
      () => _i19.LogoutUseCase(get<_i12.Storage>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(get<_i12.Storage>()));
  gh.singleton<_i21.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i22.ProductRepo>(
      () => _i23.ProductRepoImpl(get<_i21.ProductRemoteDatasource>()));
  gh.lazySingleton<_i24.SearchProductsUserCase>(
      () => _i24.SearchProductsUserCase(get<_i22.ProductRepo>()));
  gh.singleton<_i25.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i16.Dio>()));
  gh.singleton<_i26.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i27.ShoppingCartRepo>(
      () => _i28.ShoppingCartRepoImpl(get<_i26.ShoppingCartDatasource>()));
  gh.lazySingleton<_i29.UpsertCartItemUseCase>(
      () => _i29.UpsertCartItemUseCase(get<_i27.ShoppingCartRepo>()));
  gh.singleton<_i30.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i31.UserRepo>(
      () => _i32.UserRepoImpl(get<_i30.UserDatasource>()));
  gh.singleton<_i33.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i34.AddressRepo>(
      () => _i35.AddressRepoImpl(get<_i33.AddressDatasource>()));
  gh.singleton<_i36.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i37.AdsRepo>(
      () => _i38.AdsRepoImpl(get<_i36.AdsDatasource>()));
  gh.lazySingleton<_i39.AuthRepo>(
      () => _i40.AuthRepoImpl(get<_i25.ShopRemoteDatasource>()));
  gh.singleton<_i41.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i16.Dio>()));
  gh.lazySingleton<_i42.DeleteCartItemsUseCase>(
      () => _i42.DeleteCartItemsUseCase(get<_i27.ShoppingCartRepo>()));
  gh.lazySingleton<_i43.GetCommunesAndWardsUseCase>(
      () => _i43.GetCommunesAndWardsUseCase(get<_i34.AddressRepo>()));
  gh.lazySingleton<_i44.GetDistrictsUseCase>(
      () => _i44.GetDistrictsUseCase(get<_i34.AddressRepo>()));
  gh.lazySingleton<_i45.GetHomeBannersUseCase>(
      () => _i45.GetHomeBannersUseCase(get<_i37.AdsRepo>()));
  gh.lazySingleton<_i46.GetMyAddressesUseCase>(
      () => _i46.GetMyAddressesUseCase(get<_i34.AddressRepo>()));
  gh.lazySingleton<_i47.GetProductCatesUseCase>(
      () => _i47.GetProductCatesUseCase(get<_i22.ProductRepo>()));
  gh.lazySingleton<_i48.GetProductDetailUseCase>(
      () => _i48.GetProductDetailUseCase(get<_i22.ProductRepo>()));
  gh.lazySingleton<_i49.GetProductsUseCase>(
      () => _i49.GetProductsUseCase(get<_i22.ProductRepo>()));
  gh.lazySingleton<_i50.GetProvincesAndCitiesUseCase>(
      () => _i50.GetProvincesAndCitiesUseCase(get<_i34.AddressRepo>()));
  gh.lazySingleton<_i51.GetShoppingCartByIdUseCase>(
      () => _i51.GetShoppingCartByIdUseCase(get<_i27.ShoppingCartRepo>()));
  gh.lazySingleton<_i52.GetShoppingCartUseCase>(
      () => _i52.GetShoppingCartUseCase(get<_i27.ShoppingCartRepo>()));
  gh.lazySingleton<_i53.GetUserDetailUseCase>(
      () => _i53.GetUserDetailUseCase(get<_i31.UserRepo>()));
  gh.lazySingleton<_i54.HomeBloc>(() => _i54.HomeBloc(
        get<_i49.GetProductsUseCase>(),
        get<_i47.GetProductCatesUseCase>(),
        get<_i45.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i55.ProductDetailBloc>(
      () => _i55.ProductDetailBloc(get<_i48.GetProductDetailUseCase>()));
  gh.lazySingleton<_i56.SaveMyAddressUseCase>(
      () => _i56.SaveMyAddressUseCase(get<_i34.AddressRepo>()));
  gh.lazySingleton<_i57.SearchProductsBloc>(() => _i57.SearchProductsBloc(
        get<_i24.SearchProductsUserCase>(),
        get<_i49.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i58.ShopProductBloc>(() => _i58.ShopProductBloc(
        get<_i49.GetProductsUseCase>(),
        get<_i47.GetProductCatesUseCase>(),
        get<_i45.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i59.ShopProductDetailBloc>(
      () => _i59.ShopProductDetailBloc(get<_i48.GetProductDetailUseCase>()));
  gh.lazySingleton<_i60.ShoppingCartBloc>(() => _i60.ShoppingCartBloc(
        get<_i52.GetShoppingCartUseCase>(),
        get<_i29.UpsertCartItemUseCase>(),
        get<_i42.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i61.UserBloc>(
      () => _i61.UserBloc(get<_i53.GetUserDetailUseCase>()));
  gh.factory<_i62.AddressBloc>(() => _i62.AddressBloc(
        get<_i46.GetMyAddressesUseCase>(),
        get<_i50.GetProvincesAndCitiesUseCase>(),
        get<_i44.GetDistrictsUseCase>(),
        get<_i43.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i63.AddressInputBloc>(
      () => _i63.AddressInputBloc(get<_i56.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i64.AuthRepo>(
      () => _i65.AuthRepoImpl(get<_i41.AuthRepoteDatasource>()));
  gh.lazySingleton<_i66.EmailLoginUseCase>(() => _i66.EmailLoginUseCase(
        get<_i64.AuthRepo>(),
        get<_i12.Storage>(),
      ));
  gh.lazySingleton<_i67.QrBarcodeLoginUseCase>(() => _i67.QrBarcodeLoginUseCase(
        get<_i64.AuthRepo>(),
        get<_i66.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i68.LoginBloc>(() => _i68.LoginBloc(
        get<_i66.EmailLoginUseCase>(),
        get<_i67.QrBarcodeLoginUseCase>(),
        get<_i15.CheckLoginUseCase>(),
        get<_i19.LogoutUseCase>(),
        get<_i17.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i69.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i21.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i25.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i26.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i30.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i33.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i36.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i41.AuthRepoteDatasourceProvider {}
