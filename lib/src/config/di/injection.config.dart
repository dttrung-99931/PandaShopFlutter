// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i15;
import '../../../core/utils/storage.dart' as _i14;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i44;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i72;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i71;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i19;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i73;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i22;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i74;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i75;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i13;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i36;
import '../../features/common/data/data_sources/user_data_source.dart' as _i33;
import '../../features/common/data/repos/address_repo_impl.dart' as _i38;
import '../../features/common/data/repos/user_repo_impl.dart' as _i35;
import '../../features/common/domain/repos/address_repo.dart' as _i37;
import '../../features/common/domain/repos/user_repo.dart' as _i34;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i46;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i47;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i49;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i54;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i63;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i57;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i23;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i4;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i69;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i70;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i68;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i58;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i39;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i24;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i29;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i41;
import '../../features/product/data/repos/product_repo_impl.dart' as _i26;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i31;
import '../../features/product/domain/repos/ads_repo.dart' as _i40;
import '../../features/product/domain/repos/product_repo.dart' as _i25;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i30;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i53;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i48;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i50;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i51;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i52;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i27;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i45;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i55;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i56;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i32;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i61;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i5;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i7;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i64;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i67;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i28;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i43;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i42;
import '../../features/shop/domain/use_cases/check_login_usecase.dart' as _i17;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i20;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i21;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i60;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i62;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_communicaton.dart'
    as _i9;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i12;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i10;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i65;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc.dart'
    as _i6;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i66;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i11;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i59;
import 'injection.dart' as _i76; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.PickLocalImageUseCase>(
      () => _i4.PickLocalImageUseCase());
  gh.lazySingleton<_i5.ProductOptionBloc>(() => _i5.ProductOptionBloc());
  gh.lazySingleton<_i6.ProductOptionBloc>(() => _i6.ProductOptionBloc());
  gh.lazySingleton<_i7.ProductOptionCommunication>(
      () => _i7.ProductOptionCommunication());
  gh.lazySingleton<_i8.ProductOptionCommunication>(
      () => _i8.ProductOptionCommunication());
  gh.lazySingleton<_i9.ProductPropertiesInputCommunication>(
      () => _i9.ProductPropertiesInputCommunication());
  gh.lazySingleton<_i10.ShopProductCommunication>(
      () => _i10.ShopProductCommunication());
  gh.lazySingleton<_i11.ShopProductDetailCommunication>(
      () => _i11.ShopProductDetailCommunication());
  gh.lazySingleton<_i12.SignUpBloc>(() => _i12.SignUpBloc());
  gh.lazySingleton<_i13.SignUpBloc>(() => _i13.SignUpBloc());
  await gh.lazySingletonAsync<_i14.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i15.ApiInterceptor>(
      () => _i15.ApiInterceptor(get<_i14.Storage>()));
  gh.lazySingleton<_i16.CheckLoginUseCase>(
      () => _i16.CheckLoginUseCase(get<_i14.Storage>()));
  gh.lazySingleton<_i17.CheckLoginUseCase>(
      () => _i17.CheckLoginUseCase(get<_i14.Storage>()));
  gh.singleton<_i18.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i15.ApiInterceptor>()));
  gh.lazySingleton<_i19.GetRememberLoginEmailUserCase>(
      () => _i19.GetRememberLoginEmailUserCase(get<_i14.Storage>()));
  gh.lazySingleton<_i20.GetRememberLoginEmailUserCase>(
      () => _i20.GetRememberLoginEmailUserCase(get<_i14.Storage>()));
  gh.lazySingleton<_i21.LogoutUseCase>(
      () => _i21.LogoutUseCase(get<_i14.Storage>()));
  gh.lazySingleton<_i22.LogoutUseCase>(
      () => _i22.LogoutUseCase(get<_i14.Storage>()));
  gh.lazySingleton<_i23.PickLocalImageAsBase64UseCase>(() =>
      _i23.PickLocalImageAsBase64UseCase(get<_i4.PickLocalImageUseCase>()));
  gh.singleton<_i24.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i25.ProductRepo>(
      () => _i26.ProductRepoImpl(get<_i24.ProductRemoteDatasource>()));
  gh.lazySingleton<_i27.SearchProductsUserCase>(
      () => _i27.SearchProductsUserCase(get<_i25.ProductRepo>()));
  gh.singleton<_i28.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i18.Dio>()));
  gh.singleton<_i29.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i30.ShoppingCartRepo>(
      () => _i31.ShoppingCartRepoImpl(get<_i29.ShoppingCartDatasource>()));
  gh.lazySingleton<_i32.UpsertCartItemUseCase>(
      () => _i32.UpsertCartItemUseCase(get<_i30.ShoppingCartRepo>()));
  gh.singleton<_i33.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i34.UserRepo>(
      () => _i35.UserRepoImpl(get<_i33.UserDatasource>()));
  gh.singleton<_i36.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i37.AddressRepo>(
      () => _i38.AddressRepoImpl(get<_i36.AddressDatasource>()));
  gh.singleton<_i39.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i40.AdsRepo>(
      () => _i41.AdsRepoImpl(get<_i39.AdsDatasource>()));
  gh.lazySingleton<_i42.AuthRepo>(
      () => _i43.AuthRepoImpl(get<_i28.ShopRemoteDatasource>()));
  gh.singleton<_i44.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i18.Dio>()));
  gh.lazySingleton<_i45.DeleteCartItemsUseCase>(
      () => _i45.DeleteCartItemsUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i46.GetCommunesAndWardsUseCase>(
      () => _i46.GetCommunesAndWardsUseCase(get<_i37.AddressRepo>()));
  gh.lazySingleton<_i47.GetDistrictsUseCase>(
      () => _i47.GetDistrictsUseCase(get<_i37.AddressRepo>()));
  gh.lazySingleton<_i48.GetHomeBannersUseCase>(
      () => _i48.GetHomeBannersUseCase(get<_i40.AdsRepo>()));
  gh.lazySingleton<_i49.GetMyAddressesUseCase>(
      () => _i49.GetMyAddressesUseCase(get<_i37.AddressRepo>()));
  gh.lazySingleton<_i50.GetProductCatesUseCase>(
      () => _i50.GetProductCatesUseCase(get<_i25.ProductRepo>()));
  gh.lazySingleton<_i51.GetProductDetailUseCase>(
      () => _i51.GetProductDetailUseCase(get<_i25.ProductRepo>()));
  gh.lazySingleton<_i52.GetProductsUseCase>(
      () => _i52.GetProductsUseCase(get<_i25.ProductRepo>()));
  gh.lazySingleton<_i53.GetPropertyTemplateOfCateUseCase>(
      () => _i53.GetPropertyTemplateOfCateUseCase(get<_i25.ProductRepo>()));
  gh.lazySingleton<_i54.GetProvincesAndCitiesUseCase>(
      () => _i54.GetProvincesAndCitiesUseCase(get<_i37.AddressRepo>()));
  gh.lazySingleton<_i55.GetShoppingCartByIdUseCase>(
      () => _i55.GetShoppingCartByIdUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i56.GetShoppingCartUseCase>(
      () => _i56.GetShoppingCartUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i57.GetUserDetailUseCase>(
      () => _i57.GetUserDetailUseCase(get<_i34.UserRepo>()));
  gh.lazySingleton<_i58.HomeBloc>(() => _i58.HomeBloc(
        get<_i52.GetProductsUseCase>(),
        get<_i50.GetProductCatesUseCase>(),
        get<_i48.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i59.ImageInputBloc>(
      () => _i59.ImageInputBloc(get<_i23.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i60.ProductCateInputBloc>(
      () => _i60.ProductCateInputBloc(get<_i50.GetProductCatesUseCase>()));
  gh.lazySingleton<_i61.ProductDetailBloc>(
      () => _i61.ProductDetailBloc(get<_i51.GetProductDetailUseCase>()));
  gh.lazySingleton<_i62.ProductPropertiesInputBloc>(() =>
      _i62.ProductPropertiesInputBloc(
          get<_i53.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i63.SaveMyAddressUseCase>(
      () => _i63.SaveMyAddressUseCase(get<_i37.AddressRepo>()));
  gh.lazySingleton<_i64.SearchProductsBloc>(() => _i64.SearchProductsBloc(
        get<_i27.SearchProductsUserCase>(),
        get<_i52.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i65.ShopProductBloc>(() => _i65.ShopProductBloc(
        get<_i52.GetProductsUseCase>(),
        get<_i50.GetProductCatesUseCase>(),
        get<_i48.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i66.ShopProductDetailBloc>(
      () => _i66.ShopProductDetailBloc(get<_i51.GetProductDetailUseCase>()));
  gh.lazySingleton<_i67.ShoppingCartBloc>(() => _i67.ShoppingCartBloc(
        get<_i56.GetShoppingCartUseCase>(),
        get<_i32.UpsertCartItemUseCase>(),
        get<_i45.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i68.UserBloc>(
      () => _i68.UserBloc(get<_i57.GetUserDetailUseCase>()));
  gh.factory<_i69.AddressBloc>(() => _i69.AddressBloc(
        get<_i49.GetMyAddressesUseCase>(),
        get<_i54.GetProvincesAndCitiesUseCase>(),
        get<_i47.GetDistrictsUseCase>(),
        get<_i46.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i70.AddressInputBloc>(
      () => _i70.AddressInputBloc(get<_i63.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i71.AuthRepo>(
      () => _i72.AuthRepoImpl(get<_i44.AuthRepoteDatasource>()));
  gh.lazySingleton<_i73.EmailLoginUseCase>(() => _i73.EmailLoginUseCase(
        get<_i71.AuthRepo>(),
        get<_i14.Storage>(),
      ));
  gh.lazySingleton<_i74.QrBarcodeLoginUseCase>(() => _i74.QrBarcodeLoginUseCase(
        get<_i71.AuthRepo>(),
        get<_i73.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i75.LoginBloc>(() => _i75.LoginBloc(
        get<_i73.EmailLoginUseCase>(),
        get<_i74.QrBarcodeLoginUseCase>(),
        get<_i16.CheckLoginUseCase>(),
        get<_i22.LogoutUseCase>(),
        get<_i19.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i76.AppModuleDepedenciesProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i24.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i28.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i29.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i33.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i36.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i39.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i44.AuthRepoteDatasourceProvider {}
