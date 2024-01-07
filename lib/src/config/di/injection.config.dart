// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i5;
import '../../../core/utils/storage.dart' as _i4;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i14;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i22;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i21;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i6;
import '../../features/auth/domain/use_cases/email_login_usecase.dart' as _i23;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i8;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i9;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i24;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i25;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i3;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i18;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i10;
import '../../features/product/data/repos/product_repo_impl.dart' as _i12;
import '../../features/product/domain/repos/product_repo.dart' as _i11;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i15;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i16;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i17;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i13;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i19;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i20;
import 'injection.dart' as _i26; // ignore_for_file: unnecessary_lambdas

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
  final authRepoteDatasourceProvider = _$AuthRepoteDatasourceProvider();
  gh.lazySingleton<_i3.SignUpBloc>(() => _i3.SignUpBloc());
  await gh.lazySingletonAsync<_i4.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.ApiInterceptor>(
      () => _i5.ApiInterceptor(get<_i4.Storage>()));
  gh.lazySingleton<_i6.CheckLoginUseCase>(
      () => _i6.CheckLoginUseCase(get<_i4.Storage>()));
  gh.singleton<_i7.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i5.ApiInterceptor>()));
  gh.lazySingleton<_i8.GetRememberLoginEmailUserCase>(
      () => _i8.GetRememberLoginEmailUserCase(get<_i4.Storage>()));
  gh.lazySingleton<_i9.LogoutUseCase>(
      () => _i9.LogoutUseCase(get<_i4.Storage>()));
  gh.singleton<_i10.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i7.Dio>()));
  gh.lazySingleton<_i11.ProductRepo>(
      () => _i12.ProductRepoImpl(get<_i10.ProductRemoteDatasource>()));
  gh.lazySingleton<_i13.SearchProductsUserCase>(
      () => _i13.SearchProductsUserCase(get<_i11.ProductRepo>()));
  gh.singleton<_i14.AuthRepoteDatasource>(
      authRepoteDatasourceProvider.provideAuthRepoteDatasource(get<_i7.Dio>()));
  gh.lazySingleton<_i15.GetProductCatesUseCase>(
      () => _i15.GetProductCatesUseCase(get<_i11.ProductRepo>()));
  gh.lazySingleton<_i16.GetProductDetailUseCase>(
      () => _i16.GetProductDetailUseCase(get<_i11.ProductRepo>()));
  gh.lazySingleton<_i17.GetProductsUseCase>(
      () => _i17.GetProductsUseCase(get<_i11.ProductRepo>()));
  gh.lazySingleton<_i18.HomeBloc>(() => _i18.HomeBloc(
        get<_i17.GetProductsUseCase>(),
        get<_i15.GetProductCatesUseCase>(),
      ));
  gh.lazySingleton<_i19.ProductDetailBloc>(
      () => _i19.ProductDetailBloc(get<_i16.GetProductDetailUseCase>()));
  gh.lazySingleton<_i20.SearchProductsBloc>(() => _i20.SearchProductsBloc(
        get<_i13.SearchProductsUserCase>(),
        get<_i17.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i21.AuthRepo>(
      () => _i22.AuthRepoImpl(get<_i14.AuthRepoteDatasource>()));
  gh.lazySingleton<_i23.EmailLoginUseCase>(() => _i23.EmailLoginUseCase(
        get<_i21.AuthRepo>(),
        get<_i4.Storage>(),
      ));
  gh.lazySingleton<_i24.QrBarcodeLoginUseCase>(() => _i24.QrBarcodeLoginUseCase(
        get<_i21.AuthRepo>(),
        get<_i23.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i25.LoginBloc>(() => _i25.LoginBloc(
        get<_i23.EmailLoginUseCase>(),
        get<_i24.QrBarcodeLoginUseCase>(),
        get<_i6.CheckLoginUseCase>(),
        get<_i9.LogoutUseCase>(),
        get<_i8.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i26.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i10.ProductRemoteDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i14.AuthRepoteDatasourceProvider {}
