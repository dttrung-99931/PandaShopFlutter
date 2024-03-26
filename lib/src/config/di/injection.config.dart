// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i14;
import '../../../core/utils/storage.dart' as _i13;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart' as _i43;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i69;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i68;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i70;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i20;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart' as _i71;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i72;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart' as _i11;
import '../../features/common/data/data_sources/address_data_soruce.dart' as _i35;
import '../../features/common/data/data_sources/user_data_source.dart' as _i32;
import '../../features/common/data/repos/address_repo_impl.dart' as _i37;
import '../../features/common/data/repos/user_repo_impl.dart' as _i34;
import '../../features/common/domain/repos/address_repo.dart' as _i36;
import '../../features/common/domain/repos/user_repo.dart' as _i33;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart' as _i45;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart' as _i46;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart' as _i48;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart' as _i52;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart' as _i60;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart' as _i55;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart' as _i22;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart' as _i4;
import '../../features/common/presentation/bloc/address/address_bloc.dart' as _i66;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart' as _i67;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i65;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i56;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart' as _i38;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart' as _i23;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart' as _i28;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i40;
import '../../features/product/data/repos/product_repo_impl.dart' as _i25;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i30;
import '../../features/product/domain/repos/ads_repo.dart' as _i39;
import '../../features/product/domain/repos/product_repo.dart' as _i24;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i29;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart' as _i47;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart' as _i49;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart' as _i50;
import '../../features/product/domain/use_cases/get_products_usecase.dart' as _i51;
import '../../features/product/domain/use_cases/search_products_usecase.dart' as _i26;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart' as _i44;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart' as _i53;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart' as _i54;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart' as _i31;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart' as _i59;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart' as _i6;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i7;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart' as _i61;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart' as _i64;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart' as _i27;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i42;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i41;
import '../../features/shop/domain/use_cases/check_login_usecase.dart' as _i15;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart' as _i18;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i21;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart' as _i58;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i12;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart' as _i9;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart' as _i62;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc.dart' as _i5;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart' as _i63;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart' as _i10;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i57;
import 'injection.dart' as _i73; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.PickLocalImageUseCase>(() => _i4.PickLocalImageUseCase());
  gh.lazySingleton<_i5.ProductOptionBloc>(() => _i5.ProductOptionBloc());
  gh.lazySingleton<_i6.ProductOptionBloc>(() => _i6.ProductOptionBloc());
  gh.lazySingleton<_i7.ProductOptionCommunication>(() => _i7.ProductOptionCommunication());
  gh.lazySingleton<_i8.ProductOptionCommunication>(() => _i8.ProductOptionCommunication());
  gh.lazySingleton<_i9.ShopProductCommunication>(() => _i9.ShopProductCommunication());
  gh.lazySingleton<_i10.ShopProductDetailCommunication>(() => _i10.ShopProductDetailCommunication());
  gh.lazySingleton<_i11.SignUpBloc>(() => _i11.SignUpBloc());
  gh.lazySingleton<_i12.SignUpBloc>(() => _i12.SignUpBloc());
  await gh.lazySingletonAsync<_i13.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i14.ApiInterceptor>(() => _i14.ApiInterceptor(get<_i13.Storage>()));
  gh.lazySingleton<_i15.CheckLoginUseCase>(() => _i15.CheckLoginUseCase(get<_i13.Storage>()));
  gh.lazySingleton<_i16.CheckLoginUseCase>(() => _i16.CheckLoginUseCase(get<_i13.Storage>()));
  gh.singleton<_i17.Dio>(appModuleDepedenciesProvider.provideNetworkDio(get<_i14.ApiInterceptor>()));
  gh.lazySingleton<_i18.GetRememberLoginEmailUserCase>(() => _i18.GetRememberLoginEmailUserCase(get<_i13.Storage>()));
  gh.lazySingleton<_i19.GetRememberLoginEmailUserCase>(() => _i19.GetRememberLoginEmailUserCase(get<_i13.Storage>()));
  gh.lazySingleton<_i20.LogoutUseCase>(() => _i20.LogoutUseCase(get<_i13.Storage>()));
  gh.lazySingleton<_i21.LogoutUseCase>(() => _i21.LogoutUseCase(get<_i13.Storage>()));
  gh.lazySingleton<_i22.PickLocalImageAsBase64UseCase>(
      () => _i22.PickLocalImageAsBase64UseCase(get<_i4.PickLocalImageUseCase>()));
  gh.singleton<_i23.ProductRemoteDatasource>(
      productRemoteDatasourceProvider.provideProductRemoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i24.ProductRepo>(() => _i25.ProductRepoImpl(get<_i23.ProductRemoteDatasource>()));
  gh.lazySingleton<_i26.SearchProductsUserCase>(() => _i26.SearchProductsUserCase(get<_i24.ProductRepo>()));
  gh.singleton<_i27.ShopRemoteDatasource>(shopRepoteDatasourceProvider.provideShopRepoteDatasource(get<_i17.Dio>()));
  gh.singleton<_i28.ShoppingCartDatasource>(
      shoppingCartDatasourceProvider.provideShoppingCartDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i29.ShoppingCartRepo>(() => _i30.ShoppingCartRepoImpl(get<_i28.ShoppingCartDatasource>()));
  gh.lazySingleton<_i31.UpsertCartItemUseCase>(() => _i31.UpsertCartItemUseCase(get<_i29.ShoppingCartRepo>()));
  gh.singleton<_i32.UserDatasource>(userDatasourceProvider.provideUserDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i33.UserRepo>(() => _i34.UserRepoImpl(get<_i32.UserDatasource>()));
  gh.singleton<_i35.AddressDatasource>(addressDatasourceProvider.provideAddressDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i36.AddressRepo>(() => _i37.AddressRepoImpl(get<_i35.AddressDatasource>()));
  gh.singleton<_i38.AdsDatasource>(adsDatasourceProvider.provideAdsDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i39.AdsRepo>(() => _i40.AdsRepoImpl(get<_i38.AdsDatasource>()));
  gh.lazySingleton<_i41.AuthRepo>(() => _i42.AuthRepoImpl(get<_i27.ShopRemoteDatasource>()));
  gh.singleton<_i43.AuthRepoteDatasource>(authRepoteDatasourceProvider.provideAuthRepoteDatasource(get<_i17.Dio>()));
  gh.lazySingleton<_i44.DeleteCartItemsUseCase>(() => _i44.DeleteCartItemsUseCase(get<_i29.ShoppingCartRepo>()));
  gh.lazySingleton<_i45.GetCommunesAndWardsUseCase>(() => _i45.GetCommunesAndWardsUseCase(get<_i36.AddressRepo>()));
  gh.lazySingleton<_i46.GetDistrictsUseCase>(() => _i46.GetDistrictsUseCase(get<_i36.AddressRepo>()));
  gh.lazySingleton<_i47.GetHomeBannersUseCase>(() => _i47.GetHomeBannersUseCase(get<_i39.AdsRepo>()));
  gh.lazySingleton<_i48.GetMyAddressesUseCase>(() => _i48.GetMyAddressesUseCase(get<_i36.AddressRepo>()));
  gh.lazySingleton<_i49.GetProductCatesUseCase>(() => _i49.GetProductCatesUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i50.GetProductDetailUseCase>(() => _i50.GetProductDetailUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i51.GetProductsUseCase>(() => _i51.GetProductsUseCase(get<_i24.ProductRepo>()));
  gh.lazySingleton<_i52.GetProvincesAndCitiesUseCase>(() => _i52.GetProvincesAndCitiesUseCase(get<_i36.AddressRepo>()));
  gh.lazySingleton<_i53.GetShoppingCartByIdUseCase>(
      () => _i53.GetShoppingCartByIdUseCase(get<_i29.ShoppingCartRepo>()));
  gh.lazySingleton<_i54.GetShoppingCartUseCase>(() => _i54.GetShoppingCartUseCase(get<_i29.ShoppingCartRepo>()));
  gh.lazySingleton<_i55.GetUserDetailUseCase>(() => _i55.GetUserDetailUseCase(get<_i33.UserRepo>()));
  gh.lazySingleton<_i56.HomeBloc>(() => _i56.HomeBloc(
        get<_i51.GetProductsUseCase>(),
        get<_i49.GetProductCatesUseCase>(),
        get<_i47.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i57.ImageInputBloc>(() => _i57.ImageInputBloc(get<_i22.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i58.ProductCateInputBloc>(() => _i58.ProductCateInputBloc(get<_i49.GetProductCatesUseCase>()));
  gh.lazySingleton<_i59.ProductDetailBloc>(() => _i59.ProductDetailBloc(get<_i50.GetProductDetailUseCase>()));
  gh.lazySingleton<_i60.SaveMyAddressUseCase>(() => _i60.SaveMyAddressUseCase(get<_i36.AddressRepo>()));
  gh.lazySingleton<_i61.SearchProductsBloc>(() => _i61.SearchProductsBloc(
        get<_i26.SearchProductsUserCase>(),
        get<_i51.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i62.ShopProductBloc>(() => _i62.ShopProductBloc(
        get<_i51.GetProductsUseCase>(),
        get<_i49.GetProductCatesUseCase>(),
        get<_i47.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i63.ShopProductDetailBloc>(() => _i63.ShopProductDetailBloc(get<_i50.GetProductDetailUseCase>()));
  gh.lazySingleton<_i64.ShoppingCartBloc>(() => _i64.ShoppingCartBloc(
        get<_i54.GetShoppingCartUseCase>(),
        get<_i31.UpsertCartItemUseCase>(),
        get<_i44.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i65.UserBloc>(() => _i65.UserBloc(get<_i55.GetUserDetailUseCase>()));
  gh.factory<_i66.AddressBloc>(() => _i66.AddressBloc(
        get<_i48.GetMyAddressesUseCase>(),
        get<_i52.GetProvincesAndCitiesUseCase>(),
        get<_i46.GetDistrictsUseCase>(),
        get<_i45.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i67.AddressInputBloc>(() => _i67.AddressInputBloc(get<_i60.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i68.AuthRepo>(() => _i69.AuthRepoImpl(get<_i43.AuthRepoteDatasource>()));
  gh.lazySingleton<_i70.EmailLoginUseCase>(() => _i70.EmailLoginUseCase(
        get<_i68.AuthRepo>(),
        get<_i13.Storage>(),
      ));
  gh.lazySingleton<_i71.QrBarcodeLoginUseCase>(() => _i71.QrBarcodeLoginUseCase(
        get<_i68.AuthRepo>(),
        get<_i70.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i72.LoginBloc>(() => _i72.LoginBloc(
        get<_i70.EmailLoginUseCase>(),
        get<_i71.QrBarcodeLoginUseCase>(),
        get<_i16.CheckLoginUseCase>(),
        get<_i20.LogoutUseCase>(),
        get<_i19.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider extends _i73.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider extends _i23.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider extends _i27.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider extends _i28.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i32.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i35.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i38.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider extends _i43.AuthRepoteDatasourceProvider {}
