// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i9;
import '../../../core/utils/storage.dart' as _i8;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i24;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i36;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i35;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i10;
import '../../features/auth/domain/use_cases/email_login_usecase.dart' as _i37;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i12;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i13;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i38;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i39;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i7;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i31;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i22;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i14;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i18;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i23;
import '../../features/product/data/repos/product_repo_impl.dart' as _i16;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i20;
import '../../features/product/domain/repos/ads_repo.dart' as _i4;
import '../../features/product/domain/repos/product_repo.dart' as _i15;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i19;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i3;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i26;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i27;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i28;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i17;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i25;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i29;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i30;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i21;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i32;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i5;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i6;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i33;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i34;
import 'injection.dart' as _i40; // ignore_for_file: unnecessary_lambdas

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
  final adsDatasourceProvider = _$AdsDatasourceProvider();
  final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
  gh.lazySingleton<_i3.GetHomeBannersUseCase>(
      () => _i3.GetHomeBannersUseCase(get<_i4.AdsRepo>()));
  gh.lazySingleton<_i5.ProductOptionBloc>(() => _i5.ProductOptionBloc());
  gh.lazySingleton<_i6.ProductOptionCommunication>(
      () => _i6.ProductOptionCommunication());
  gh.lazySingleton<_i7.SignUpBloc>(() => _i7.SignUpBloc());
  await gh.lazySingletonAsync<_i8.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i9.ApiInterceptor>(
      () => _i9.ApiInterceptor(get<_i8.Storage>()));
  gh.lazySingleton<_i10.CheckLoginUseCase>(
      () => _i10.CheckLoginUseCase(get<_i8.Storage>()));
  gh.singleton<_i11.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i9.ApiInterceptor>()));
  gh.lazySingleton<_i12.GetRememberLoginEmailUserCase>(
      () => _i12.GetRememberLoginEmailUserCase(get<_i8.Storage>()));
  gh.lazySingleton<_i13.LogoutUseCase>(
      () => _i13.LogoutUseCase(get<_i8.Storage>()));
  gh.singleton<_i14.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i11.Dio>()));
  gh.lazySingleton<_i15.ProductRepo>(
      () => _i16.ProductRepoImpl(get<_i14.ProductRemoteDatasource>()));
  gh.lazySingleton<_i17.SearchProductsUserCase>(
      () => _i17.SearchProductsUserCase(get<_i15.ProductRepo>()));
  gh.singleton<_i18.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i11.Dio>()));
  gh.lazySingleton<_i19.ShoppingCartRepo>(
      () => _i20.ShoppingCartRepoImpl(get<_i18.ShoppingCartDatasource>()));
  gh.lazySingleton<_i21.UpsertCartItemUseCase>(
      () => _i21.UpsertCartItemUseCase(get<_i19.ShoppingCartRepo>()));
  gh.singleton<_i22.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i11.Dio>()));
  gh.lazySingleton<_i23.AdsRepoImpl>(
      () => _i23.AdsRepoImpl(get<_i22.AdsDatasource>()));
  gh.singleton<_i24.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i11.Dio>()));
  gh.lazySingleton<_i25.DeleteCartItemsUseCase>(
      () => _i25.DeleteCartItemsUseCase(get<_i19.ShoppingCartRepo>()));
  gh.lazySingleton<_i26.GetProductCatesUseCase>(
      () => _i26.GetProductCatesUseCase(get<_i15.ProductRepo>()));
  gh.lazySingleton<_i27.GetProductDetailUseCase>(
      () => _i27.GetProductDetailUseCase(get<_i15.ProductRepo>()));
  gh.lazySingleton<_i28.GetProductsUseCase>(
      () => _i28.GetProductsUseCase(get<_i15.ProductRepo>()));
  gh.lazySingleton<_i29.GetShoppingCartByIdUseCase>(
      () => _i29.GetShoppingCartByIdUseCase(get<_i19.ShoppingCartRepo>()));
  gh.lazySingleton<_i30.GetShoppingCartUseCase>(
      () => _i30.GetShoppingCartUseCase(get<_i19.ShoppingCartRepo>()));
  gh.lazySingleton<_i31.HomeBloc>(() => _i31.HomeBloc(
        get<_i28.GetProductsUseCase>(),
        get<_i26.GetProductCatesUseCase>(),
        get<_i3.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i32.ProductDetailBloc>(
      () => _i32.ProductDetailBloc(get<_i27.GetProductDetailUseCase>()));
  gh.lazySingleton<_i33.SearchProductsBloc>(() => _i33.SearchProductsBloc(
        get<_i17.SearchProductsUserCase>(),
        get<_i28.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i34.ShoppingCartBloc>(() => _i34.ShoppingCartBloc(
        get<_i30.GetShoppingCartUseCase>(),
        get<_i21.UpsertCartItemUseCase>(),
        get<_i25.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i35.AuthRepo>(
      () => _i36.AuthRepoImpl(get<_i24.AuthRepoteDatasource>()));
  gh.lazySingleton<_i37.EmailLoginUseCase>(() => _i37.EmailLoginUseCase(
        get<_i35.AuthRepo>(),
        get<_i8.Storage>(),
      ));
  gh.lazySingleton<_i38.QrBarcodeLoginUseCase>(() => _i38.QrBarcodeLoginUseCase(
        get<_i35.AuthRepo>(),
        get<_i37.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i39.LoginBloc>(() => _i39.LoginBloc(
        get<_i37.EmailLoginUseCase>(),
        get<_i38.QrBarcodeLoginUseCase>(),
        get<_i10.CheckLoginUseCase>(),
        get<_i13.LogoutUseCase>(),
        get<_i12.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i40.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i14.ProductRemoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i18.ShoppingCartDatasourceProvider {}

class _$AdsDatasourceProvider extends _i22.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i24.AuthRepoteDatasourceProvider {}
