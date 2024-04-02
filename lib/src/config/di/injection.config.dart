// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i17;
import '../../../core/utils/storage.dart' as _i16;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i49;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i80;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i79;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i18;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i21;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i81;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i23;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i82;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i83;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i15;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i41;
import '../../features/common/data/data_sources/user_data_source.dart' as _i38;
import '../../features/common/data/repos/address_repo_impl.dart' as _i43;
import '../../features/common/data/repos/user_repo_impl.dart' as _i40;
import '../../features/common/domain/repos/address_repo.dart' as _i42;
import '../../features/common/domain/repos/user_repo.dart' as _i39;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i53;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i54;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i56;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i62;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i71;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i65;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i25;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i4;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i77;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i78;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i76;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i66;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i44;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i26;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i29;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i34;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i46;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i28;
import '../../features/product/data/repos/product_repo_impl.dart' as _i31;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i36;
import '../../features/product/domain/repos/ads_repo.dart' as _i45;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i27;
import '../../features/product/domain/repos/product_repo.dart' as _i30;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i35;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i61;
import '../../features/product/domain/use_cases/create_product_usecase.dart'
    as _i51;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i55;
import '../../features/product/domain/use_cases/get_product_cate_by_id_usecase.dart'
    as _i57;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i59;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i60;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i50;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i32;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i52;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i63;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i64;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i37;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i69;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i5;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i7;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i72;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i75;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i33;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i48;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i47;
import '../../features/shop/domain/use_cases/check_login_usecase.dart' as _i19;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i22;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i24;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i68;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i9;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_communicaton.dart'
    as _i10;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i70;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_communicaton.dart'
    as _i11;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i14;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i12;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i73;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc.dart'
    as _i6;
import '../../features/shop/presentation/bloc/shop_product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i74;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i13;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i67;
import 'injection.dart' as _i84; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.ProductOptionsInputBloc>(
      () => _i9.ProductOptionsInputBloc());
  gh.lazySingleton<_i10.ProductOptionsInputCommunication>(
      () => _i10.ProductOptionsInputCommunication());
  gh.lazySingleton<_i11.ProductPropertiesInputCommunication>(
      () => _i11.ProductPropertiesInputCommunication());
  gh.lazySingleton<_i12.ShopProductCommunication>(
      () => _i12.ShopProductCommunication());
  gh.lazySingleton<_i13.ShopProductDetailCommunication>(
      () => _i13.ShopProductDetailCommunication());
  gh.lazySingleton<_i14.SignUpBloc>(() => _i14.SignUpBloc());
  gh.lazySingleton<_i15.SignUpBloc>(() => _i15.SignUpBloc());
  await gh.lazySingletonAsync<_i16.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i17.ApiInterceptor>(
      () => _i17.ApiInterceptor(get<_i16.Storage>()));
  gh.lazySingleton<_i18.CheckLoginUseCase>(
      () => _i18.CheckLoginUseCase(get<_i16.Storage>()));
  gh.lazySingleton<_i19.CheckLoginUseCase>(
      () => _i19.CheckLoginUseCase(get<_i16.Storage>()));
  gh.singleton<_i20.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i17.ApiInterceptor>()));
  gh.lazySingleton<_i21.GetRememberLoginEmailUserCase>(
      () => _i21.GetRememberLoginEmailUserCase(get<_i16.Storage>()));
  gh.lazySingleton<_i22.GetRememberLoginEmailUserCase>(
      () => _i22.GetRememberLoginEmailUserCase(get<_i16.Storage>()));
  gh.lazySingleton<_i23.LogoutUseCase>(
      () => _i23.LogoutUseCase(get<_i16.Storage>()));
  gh.lazySingleton<_i24.LogoutUseCase>(
      () => _i24.LogoutUseCase(get<_i16.Storage>()));
  gh.lazySingleton<_i25.PickLocalImageAsBase64UseCase>(() =>
      _i25.PickLocalImageAsBase64UseCase(get<_i4.PickLocalImageUseCase>()));
  gh.singleton<_i26.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i27.ProductCateRepo>(
      () => _i28.ProductRepoImpl(get<_i26.ProductCateDatasource>()));
  gh.singleton<_i29.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i30.ProductRepo>(
      () => _i31.ProductRepoImpl(get<_i29.ProductRemoteDatasource>()));
  gh.lazySingleton<_i32.SearchProductsUserCase>(
      () => _i32.SearchProductsUserCase(get<_i30.ProductRepo>()));
  gh.singleton<_i33.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i20.Dio>()));
  gh.singleton<_i34.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i35.ShoppingCartRepo>(
      () => _i36.ShoppingCartRepoImpl(get<_i34.ShoppingCartDatasource>()));
  gh.lazySingleton<_i37.UpsertCartItemUseCase>(
      () => _i37.UpsertCartItemUseCase(get<_i35.ShoppingCartRepo>()));
  gh.singleton<_i38.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i39.UserRepo>(
      () => _i40.UserRepoImpl(get<_i38.UserDatasource>()));
  gh.singleton<_i41.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i42.AddressRepo>(
      () => _i43.AddressRepoImpl(get<_i41.AddressDatasource>()));
  gh.singleton<_i44.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i45.AdsRepo>(
      () => _i46.AdsRepoImpl(get<_i44.AdsDatasource>()));
  gh.lazySingleton<_i47.AuthRepo>(
      () => _i48.AuthRepoImpl(get<_i33.ShopRemoteDatasource>()));
  gh.singleton<_i49.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i20.Dio>()));
  gh.lazySingleton<_i50.CreateProductImagesUseCase>(
      () => _i50.CreateProductImagesUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i51.CreateProductUseCase>(
      () => _i51.CreateProductUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i52.DeleteCartItemsUseCase>(
      () => _i52.DeleteCartItemsUseCase(get<_i35.ShoppingCartRepo>()));
  gh.lazySingleton<_i53.GetCommunesAndWardsUseCase>(
      () => _i53.GetCommunesAndWardsUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i54.GetDistrictsUseCase>(
      () => _i54.GetDistrictsUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i55.GetHomeBannersUseCase>(
      () => _i55.GetHomeBannersUseCase(get<_i45.AdsRepo>()));
  gh.lazySingleton<_i56.GetMyAddressesUseCase>(
      () => _i56.GetMyAddressesUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i57.GetProductCateByIdUseCase>(
      () => _i57.GetProductCateByIdUseCase(get<_i27.ProductCateRepo>()));
  gh.lazySingleton<_i58.GetProductCatesUseCase>(
      () => _i58.GetProductCatesUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i59.GetProductDetailUseCase>(
      () => _i59.GetProductDetailUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i60.GetProductsUseCase>(
      () => _i60.GetProductsUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i61.GetPropertyTemplateOfCateUseCase>(
      () => _i61.GetPropertyTemplateOfCateUseCase(get<_i30.ProductRepo>()));
  gh.lazySingleton<_i62.GetProvincesAndCitiesUseCase>(
      () => _i62.GetProvincesAndCitiesUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i63.GetShoppingCartByIdUseCase>(
      () => _i63.GetShoppingCartByIdUseCase(get<_i35.ShoppingCartRepo>()));
  gh.lazySingleton<_i64.GetShoppingCartUseCase>(
      () => _i64.GetShoppingCartUseCase(get<_i35.ShoppingCartRepo>()));
  gh.lazySingleton<_i65.GetUserDetailUseCase>(
      () => _i65.GetUserDetailUseCase(get<_i39.UserRepo>()));
  gh.lazySingleton<_i66.HomeBloc>(() => _i66.HomeBloc(
        get<_i60.GetProductsUseCase>(),
        get<_i58.GetProductCatesUseCase>(),
        get<_i55.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i67.ImageInputBloc>(
      () => _i67.ImageInputBloc(get<_i25.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i68.ProductCateInputBloc>(() => _i68.ProductCateInputBloc(
        get<_i58.GetProductCatesUseCase>(),
        get<_i57.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i69.ProductDetailBloc>(
      () => _i69.ProductDetailBloc(get<_i59.GetProductDetailUseCase>()));
  gh.lazySingleton<_i70.ProductPropertiesInputBloc>(() =>
      _i70.ProductPropertiesInputBloc(
          get<_i61.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i71.SaveMyAddressUseCase>(
      () => _i71.SaveMyAddressUseCase(get<_i42.AddressRepo>()));
  gh.lazySingleton<_i72.SearchProductsBloc>(() => _i72.SearchProductsBloc(
        get<_i32.SearchProductsUserCase>(),
        get<_i60.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i73.ShopProductBloc>(() => _i73.ShopProductBloc(
        get<_i60.GetProductsUseCase>(),
        get<_i58.GetProductCatesUseCase>(),
        get<_i55.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i74.ShopProductDetailBloc>(
    () => _i74.ShopProductDetailBloc(
      get<_i59.GetProductDetailUseCase>(),
      get<_i51.CreateProductUseCase>(),
      get<_i50.CreateProductImagesUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i75.ShoppingCartBloc>(() => _i75.ShoppingCartBloc(
        get<_i64.GetShoppingCartUseCase>(),
        get<_i37.UpsertCartItemUseCase>(),
        get<_i52.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i76.UserBloc>(
      () => _i76.UserBloc(get<_i65.GetUserDetailUseCase>()));
  gh.factory<_i77.AddressBloc>(() => _i77.AddressBloc(
        get<_i56.GetMyAddressesUseCase>(),
        get<_i62.GetProvincesAndCitiesUseCase>(),
        get<_i54.GetDistrictsUseCase>(),
        get<_i53.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i78.AddressInputBloc>(
      () => _i78.AddressInputBloc(get<_i71.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i79.AuthRepo>(
      () => _i80.AuthRepoImpl(get<_i49.AuthRepoteDatasource>()));
  gh.lazySingleton<_i81.EmailLoginUseCase>(() => _i81.EmailLoginUseCase(
        get<_i79.AuthRepo>(),
        get<_i16.Storage>(),
      ));
  gh.lazySingleton<_i82.QrBarcodeLoginUseCase>(() => _i82.QrBarcodeLoginUseCase(
        get<_i79.AuthRepo>(),
        get<_i81.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i83.LoginBloc>(() => _i83.LoginBloc(
        get<_i81.EmailLoginUseCase>(),
        get<_i82.QrBarcodeLoginUseCase>(),
        get<_i18.CheckLoginUseCase>(),
        get<_i23.LogoutUseCase>(),
        get<_i21.GetRememberLoginEmailUserCase>(),
      ));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i84.AppModuleDepedenciesProvider {}

class _$ProductCateDatasourceProvider
    extends _i26.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i29.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i33.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i34.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i38.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i41.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i44.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i49.AuthRepoteDatasourceProvider {}
