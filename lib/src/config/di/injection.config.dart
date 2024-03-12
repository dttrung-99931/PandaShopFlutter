// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i7;
import '../../../core/utils/storage.dart' as _i6;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i16;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i24;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i23;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i8;
import '../../features/auth/domain/use_cases/email_login_usecase.dart' as _i25;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i10;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i11;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i26;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i27;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i5;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i20;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i12;
import '../../features/product/data/repos/product_repo_impl.dart' as _i14;
import '../../features/product/domain/repos/product_repo.dart' as _i13;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i17;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i18;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i19;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i15;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i21;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i3;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i4;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i22;
import 'injection.dart' as _i28; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.ProductOptionBloc>(() => _i3.ProductOptionBloc());
  gh.lazySingleton<_i4.ProductOptionCommunication>(
      () => _i4.ProductOptionCommunication());
  gh.lazySingleton<_i5.SignUpBloc>(() => _i5.SignUpBloc());
  await gh.lazySingletonAsync<_i6.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i7.ApiInterceptor>(
      () => _i7.ApiInterceptor(get<_i6.Storage>()));
  gh.lazySingleton<_i8.CheckLoginUseCase>(
      () => _i8.CheckLoginUseCase(get<_i6.Storage>()));
  gh.singleton<_i9.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i7.ApiInterceptor>()));
  gh.lazySingleton<_i10.GetRememberLoginEmailUserCase>(
      () => _i10.GetRememberLoginEmailUserCase(get<_i6.Storage>()));
  gh.lazySingleton<_i11.LogoutUseCase>(
      () => _i11.LogoutUseCase(get<_i6.Storage>()));
  gh.singleton<_i12.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i9.Dio>()));
  gh.lazySingleton<_i13.ProductRepo>(
      () => _i14.ProductRepoImpl(get<_i12.ProductRemoteDatasource>()));
  gh.lazySingleton<_i15.SearchProductsUserCase>(
      () => _i15.SearchProductsUserCase(get<_i13.ProductRepo>()));
  gh.singleton<_i16.AuthRepoteDatasource>(
      authRepoteDatasourceProvider.provideAuthRepoteDatasource(get<_i9.Dio>()));
  gh.lazySingleton<_i17.GetProductCatesUseCase>(
      () => _i17.GetProductCatesUseCase(get<_i13.ProductRepo>()));
  gh.lazySingleton<_i18.GetProductDetailUseCase>(
      () => _i18.GetProductDetailUseCase(get<_i13.ProductRepo>()));
  gh.lazySingleton<_i19.GetProductsUseCase>(
      () => _i19.GetProductsUseCase(get<_i13.ProductRepo>()));
  gh.lazySingleton<_i20.HomeBloc>(() => _i20.HomeBloc(
        get<_i19.GetProductsUseCase>(),
        get<_i17.GetProductCatesUseCase>(),
      ));
  gh.lazySingleton<_i21.ProductDetailBloc>(
      () => _i21.ProductDetailBloc(get<_i18.GetProductDetailUseCase>()));
  gh.lazySingleton<_i22.SearchProductsBloc>(() => _i22.SearchProductsBloc(
        get<_i15.SearchProductsUserCase>(),
        get<_i19.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i23.AuthRepo>(
      () => _i24.AuthRepoImpl(get<_i16.AuthRepoteDatasource>()));
  gh.lazySingleton<_i25.EmailLoginUseCase>(() => _i25.EmailLoginUseCase(
        get<_i23.AuthRepo>(),
        get<_i6.Storage>(),
      ));
  gh.lazySingleton<_i26.QrBarcodeLoginUseCase>(() => _i26.QrBarcodeLoginUseCase(
        get<_i23.AuthRepo>(),
        get<_i25.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i27.LoginBloc>(() => _i27.LoginBloc(
        get<_i25.EmailLoginUseCase>(),
        get<_i26.QrBarcodeLoginUseCase>(),
        get<_i8.CheckLoginUseCase>(),
        get<_i11.LogoutUseCase>(),
        get<_i10.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i28.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i12.ProductRemoteDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i16.AuthRepoteDatasourceProvider {}
