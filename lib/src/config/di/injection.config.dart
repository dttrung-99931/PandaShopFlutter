// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../core/interceptors/api_interceptor.dart' as _i11;
import '../../../core/utils/storage.dart' as _i10;
import '../../features/auth/data/data_sources/auth_remote_data_soruce.dart'
    as _i43;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i77;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i76;
import '../../features/auth/domain/use_cases/check_login_usecase.dart' as _i12;
import '../../features/auth/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i14;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i78;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/qr_barcode_reader_login_usecase.dart'
    as _i79;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i80;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i81;
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart'
    as _i82;
import '../../features/common/data/data_sources/address_data_soruce.dart'
    as _i37;
import '../../features/common/data/data_sources/user_data_source.dart' as _i34;
import '../../features/common/data/repos/address_repo_impl.dart' as _i39;
import '../../features/common/data/repos/user_repo_impl.dart' as _i36;
import '../../features/common/domain/repos/address_repo.dart' as _i38;
import '../../features/common/domain/repos/user_repo.dart' as _i35;
import '../../features/common/domain/use_cases/get_communes_and_ward_usecase.dart'
    as _i48;
import '../../features/common/domain/use_cases/get_district_usecase_usecase.dart'
    as _i49;
import '../../features/common/domain/use_cases/get_my_addresses_usecase.dart'
    as _i51;
import '../../features/common/domain/use_cases/get_provinces_and_cities_usecase.dart'
    as _i57;
import '../../features/common/domain/use_cases/save_my_address_usecase.dart'
    as _i67;
import '../../features/common/domain/use_cases/user/get_user_detail_usecase.dart'
    as _i60;
import '../../features/common/domain/use_cases/utils/pick_local_image_as_base64_use_case.dart'
    as _i18;
import '../../features/common/domain/use_cases/utils/pick_local_image_use_case.dart'
    as _i4;
import '../../features/common/presentation/bloc/address/address_bloc.dart'
    as _i74;
import '../../features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart'
    as _i75;
import '../../features/common/presentation/bloc/user/user_bloc.dart' as _i73;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i61;
import '../../features/product/data/data_sources/ads/ads_data_soruce.dart'
    as _i40;
import '../../features/product/data/data_sources/product_cate_data_soruce.dart'
    as _i19;
import '../../features/product/data/data_sources/product_remote_data_soruce.dart'
    as _i22;
import '../../features/product/data/data_sources/shopping_cart_data_soruce.dart'
    as _i29;
import '../../features/product/data/repos/ads_repo_impl.dart' as _i42;
import '../../features/product/data/repos/product_repo_cate_impl.dart' as _i21;
import '../../features/product/data/repos/product_repo_impl.dart' as _i24;
import '../../features/product/data/repos/shopping_cart_repo_impl.dart' as _i31;
import '../../features/product/domain/repos/ads_repo.dart' as _i41;
import '../../features/product/domain/repos/product_cate_repo.dart' as _i20;
import '../../features/product/domain/repos/product_repo.dart' as _i23;
import '../../features/product/domain/repos/shopping_cart_repo.dart' as _i30;
import '../../features/product/domain/use_cases/cate_property_template/get_property_template_of_cate_usecase.dart'
    as _i56;
import '../../features/product/domain/use_cases/create_product_usecase.dart'
    as _i45;
import '../../features/product/domain/use_cases/get_home_banners_usecase.dart'
    as _i50;
import '../../features/product/domain/use_cases/get_product_cate_by_id_usecase.dart'
    as _i52;
import '../../features/product/domain/use_cases/get_product_cates_usecase.dart'
    as _i53;
import '../../features/product/domain/use_cases/get_product_detail_usecase.dart'
    as _i54;
import '../../features/product/domain/use_cases/get_products_usecase.dart'
    as _i55;
import '../../features/product/domain/use_cases/image/create_product_image_usecase.dart'
    as _i44;
import '../../features/product/domain/use_cases/product/delete_product_usecase.dart'
    as _i47;
import '../../features/product/domain/use_cases/search_products_usecase.dart'
    as _i25;
import '../../features/product/domain/use_cases/shopping_cart/delete_cart_items_usecase.dart'
    as _i46;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_by_id_usecase.dart'
    as _i58;
import '../../features/product/domain/use_cases/shopping_cart/get_shopping_cart_usecase.dart'
    as _i59;
import '../../features/product/domain/use_cases/shopping_cart/upsert_cart_item_usecase.dart'
    as _i33;
import '../../features/product/domain/use_cases/update_product_usecase.dart'
    as _i32;
import '../../features/product/presentation/bloc/order/order_bloc.dart' as _i3;
import '../../features/product/presentation/bloc/product_detail/product_detail_bloc.dart'
    as _i64;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart'
    as _i5;
import '../../features/product/presentation/bloc/product_detail/product_option/product_option_bloc_communicaton.dart'
    as _i6;
import '../../features/product/presentation/bloc/search/search_products_bloc.dart'
    as _i68;
import '../../features/product/presentation/bloc/shopping_cart/shopping_cart_bloc.dart'
    as _i72;
import '../../features/shop/data/data_sources/shop_remote_data_soruce.dart'
    as _i26;
import '../../features/shop/data/repositories/shop_repo_impl.dart' as _i28;
import '../../features/shop/domain/repositories/shop_repo.dart' as _i27;
import '../../features/shop/domain/use_cases/get_remember_login_email_usecase.dart'
    as _i15;
import '../../features/shop/domain/use_cases/logout_usecase.dart' as _i17;
import '../../features/shop/domain/use_cases/register_shop_usecase.dart'
    as _i66;
import '../../features/shop/presentation/bloc/product_cate_input/product_cate_input_bloc.dart'
    as _i63;
import '../../features/shop/presentation/bloc/product_options_input/product_options_input_bloc.dart'
    as _i7;
import '../../features/shop/presentation/bloc/product_properties_input/product_properties_input_bloc.dart'
    as _i65;
import '../../features/shop/presentation/bloc/shop/shop_bloc.dart' as _i69;
import '../../features/shop/presentation/bloc/shop_product/shop_bloc_communicaton.dart'
    as _i8;
import '../../features/shop/presentation/bloc/shop_product/shop_product_bloc.dart'
    as _i70;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_bloc.dart'
    as _i71;
import '../../features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart'
    as _i9;
import '../../shared/bloc/image_input/image_input_bloc.dart' as _i62;
import 'injection.dart' as _i83; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.ProductOptionCommunication>(
      () => _i6.ProductOptionCommunication());
  gh.lazySingleton<_i7.ProductOptionsInputBloc>(
      () => _i7.ProductOptionsInputBloc());
  gh.lazySingleton<_i8.ShopProductCommunication>(
      () => _i8.ShopProductCommunication());
  gh.lazySingleton<_i9.ShopProductDetailCommunication>(
      () => _i9.ShopProductDetailCommunication());
  await gh.lazySingletonAsync<_i10.Storage>(
    () => appModuleDepedenciesProvider.provideStorage(),
    preResolve: true,
  );
  gh.lazySingleton<_i11.ApiInterceptor>(
      () => _i11.ApiInterceptor(get<_i10.Storage>()));
  gh.lazySingleton<_i12.CheckLoginUseCase>(
      () => _i12.CheckLoginUseCase(get<_i10.Storage>()));
  gh.singleton<_i13.Dio>(appModuleDepedenciesProvider
      .provideNetworkDio(get<_i11.ApiInterceptor>()));
  gh.lazySingleton<_i14.GetRememberLoginEmailUserCase>(
      () => _i14.GetRememberLoginEmailUserCase(get<_i10.Storage>()));
  gh.lazySingleton<_i15.GetRememberLoginEmailUserCase>(
      () => _i15.GetRememberLoginEmailUserCase(get<_i10.Storage>()));
  gh.lazySingleton<_i16.LogoutUseCase>(
      () => _i16.LogoutUseCase(get<_i10.Storage>()));
  gh.lazySingleton<_i17.LogoutUseCase>(
      () => _i17.LogoutUseCase(get<_i10.Storage>()));
  gh.lazySingleton<_i18.PickLocalImageAsBase64UseCase>(() =>
      _i18.PickLocalImageAsBase64UseCase(get<_i4.PickLocalImageUseCase>()));
  gh.singleton<_i19.ProductCateDatasource>(productCateDatasourceProvider
      .provideProductCateDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i20.ProductCateRepo>(
      () => _i21.ProductRepoImpl(get<_i19.ProductCateDatasource>()));
  gh.singleton<_i22.ProductRemoteDatasource>(productRemoteDatasourceProvider
      .provideProductRemoteDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i23.ProductRepo>(
      () => _i24.ProductRepoImpl(get<_i22.ProductRemoteDatasource>()));
  gh.lazySingleton<_i25.SearchProductsUserCase>(
      () => _i25.SearchProductsUserCase(get<_i23.ProductRepo>()));
  gh.singleton<_i26.ShopRemoteDatasource>(shopRepoteDatasourceProvider
      .provideShopRepoteDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i27.ShopRepo>(
      () => _i28.ShopRepoImpl(get<_i26.ShopRemoteDatasource>()));
  gh.singleton<_i29.ShoppingCartDatasource>(shoppingCartDatasourceProvider
      .provideShoppingCartDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i30.ShoppingCartRepo>(
      () => _i31.ShoppingCartRepoImpl(get<_i29.ShoppingCartDatasource>()));
  gh.lazySingleton<_i32.UpdateProductUseCase>(
      () => _i32.UpdateProductUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i33.UpsertCartItemUseCase>(
      () => _i33.UpsertCartItemUseCase(get<_i30.ShoppingCartRepo>()));
  gh.singleton<_i34.UserDatasource>(
      userDatasourceProvider.provideUserDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i35.UserRepo>(
      () => _i36.UserRepoImpl(get<_i34.UserDatasource>()));
  gh.singleton<_i37.AddressDatasource>(
      addressDatasourceProvider.provideAddressDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i38.AddressRepo>(
      () => _i39.AddressRepoImpl(get<_i37.AddressDatasource>()));
  gh.singleton<_i40.AdsDatasource>(
      adsDatasourceProvider.provideAdsDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i41.AdsRepo>(
      () => _i42.AdsRepoImpl(get<_i40.AdsDatasource>()));
  gh.singleton<_i43.AuthRepoteDatasource>(authRepoteDatasourceProvider
      .provideAuthRepoteDatasource(get<_i13.Dio>()));
  gh.lazySingleton<_i44.CreateProductImagesUseCase>(
      () => _i44.CreateProductImagesUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i45.CreateProductUseCase>(
      () => _i45.CreateProductUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i46.DeleteCartItemsUseCase>(
      () => _i46.DeleteCartItemsUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i47.DeleteProductUseCase>(
      () => _i47.DeleteProductUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i48.GetCommunesAndWardsUseCase>(
      () => _i48.GetCommunesAndWardsUseCase(get<_i38.AddressRepo>()));
  gh.lazySingleton<_i49.GetDistrictsUseCase>(
      () => _i49.GetDistrictsUseCase(get<_i38.AddressRepo>()));
  gh.lazySingleton<_i50.GetHomeBannersUseCase>(
      () => _i50.GetHomeBannersUseCase(get<_i41.AdsRepo>()));
  gh.lazySingleton<_i51.GetMyAddressesUseCase>(
      () => _i51.GetMyAddressesUseCase(get<_i38.AddressRepo>()));
  gh.lazySingleton<_i52.GetProductCateByIdUseCase>(
      () => _i52.GetProductCateByIdUseCase(get<_i20.ProductCateRepo>()));
  gh.lazySingleton<_i53.GetProductCatesUseCase>(
      () => _i53.GetProductCatesUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i54.GetProductDetailUseCase>(
      () => _i54.GetProductDetailUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i55.GetProductsUseCase>(
      () => _i55.GetProductsUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i56.GetPropertyTemplateOfCateUseCase>(
      () => _i56.GetPropertyTemplateOfCateUseCase(get<_i23.ProductRepo>()));
  gh.lazySingleton<_i57.GetProvincesAndCitiesUseCase>(
      () => _i57.GetProvincesAndCitiesUseCase(get<_i38.AddressRepo>()));
  gh.lazySingleton<_i58.GetShoppingCartByIdUseCase>(
      () => _i58.GetShoppingCartByIdUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i59.GetShoppingCartUseCase>(
      () => _i59.GetShoppingCartUseCase(get<_i30.ShoppingCartRepo>()));
  gh.lazySingleton<_i60.GetUserDetailUseCase>(
      () => _i60.GetUserDetailUseCase(get<_i35.UserRepo>()));
  gh.lazySingleton<_i61.HomeBloc>(() => _i61.HomeBloc(
        get<_i55.GetProductsUseCase>(),
        get<_i53.GetProductCatesUseCase>(),
        get<_i50.GetHomeBannersUseCase>(),
      ));
  gh.lazySingleton<_i62.ImageInputBloc>(
      () => _i62.ImageInputBloc(get<_i18.PickLocalImageAsBase64UseCase>()));
  gh.lazySingleton<_i63.ProductCateInputBloc>(() => _i63.ProductCateInputBloc(
        get<_i53.GetProductCatesUseCase>(),
        get<_i52.GetProductCateByIdUseCase>(),
      ));
  gh.lazySingleton<_i64.ProductDetailBloc>(
      () => _i64.ProductDetailBloc(get<_i54.GetProductDetailUseCase>()));
  gh.lazySingleton<_i65.ProductPropertiesInputBloc>(() =>
      _i65.ProductPropertiesInputBloc(
          get<_i56.GetPropertyTemplateOfCateUseCase>()));
  gh.lazySingleton<_i66.RegisterShopUseCase>(
      () => _i66.RegisterShopUseCase(get<_i27.ShopRepo>()));
  gh.lazySingleton<_i67.SaveMyAddressUseCase>(
      () => _i67.SaveMyAddressUseCase(get<_i38.AddressRepo>()));
  gh.lazySingleton<_i68.SearchProductsBloc>(() => _i68.SearchProductsBloc(
        get<_i25.SearchProductsUserCase>(),
        get<_i55.GetProductsUseCase>(),
      ));
  gh.lazySingleton<_i69.ShopBloc>(
      () => _i69.ShopBloc(get<_i66.RegisterShopUseCase>()));
  gh.lazySingleton<_i70.ShopProductBloc>(() => _i70.ShopProductBloc(
        get<_i55.GetProductsUseCase>(),
        get<_i53.GetProductCatesUseCase>(),
        get<_i50.GetHomeBannersUseCase>(),
        get<_i47.DeleteProductUseCase>(),
      ));
  gh.lazySingleton<_i71.ShopProductDetailBloc>(
    () => _i71.ShopProductDetailBloc(
      get<_i54.GetProductDetailUseCase>(),
      get<_i45.CreateProductUseCase>(),
      get<_i44.CreateProductImagesUseCase>(),
      get<_i32.UpdateProductUseCase>(),
    ),
    dispose: (i) => i.close(),
  );
  gh.lazySingleton<_i72.ShoppingCartBloc>(() => _i72.ShoppingCartBloc(
        get<_i59.GetShoppingCartUseCase>(),
        get<_i33.UpsertCartItemUseCase>(),
        get<_i46.DeleteCartItemsUseCase>(),
      ));
  gh.lazySingleton<_i73.UserBloc>(
      () => _i73.UserBloc(get<_i60.GetUserDetailUseCase>()));
  gh.factory<_i74.AddressBloc>(() => _i74.AddressBloc(
        get<_i51.GetMyAddressesUseCase>(),
        get<_i57.GetProvincesAndCitiesUseCase>(),
        get<_i49.GetDistrictsUseCase>(),
        get<_i48.GetCommunesAndWardsUseCase>(),
      ));
  gh.lazySingleton<_i75.AddressInputBloc>(
      () => _i75.AddressInputBloc(get<_i67.SaveMyAddressUseCase>()));
  gh.lazySingleton<_i76.AuthRepo>(
      () => _i77.AuthRepoImpl(get<_i43.AuthRepoteDatasource>()));
  gh.lazySingleton<_i78.EmailLoginUseCase>(() => _i78.EmailLoginUseCase(
        get<_i76.AuthRepo>(),
        get<_i10.Storage>(),
      ));
  gh.lazySingleton<_i79.QrBarcodeLoginUseCase>(() => _i79.QrBarcodeLoginUseCase(
        get<_i76.AuthRepo>(),
        get<_i78.EmailLoginUseCase>(),
      ));
  gh.lazySingleton<_i80.SignUpUseCase>(
      () => _i80.SignUpUseCase(get<_i76.AuthRepo>()));
  gh.lazySingleton<_i81.LoginBloc>(() => _i81.LoginBloc(
        get<_i78.EmailLoginUseCase>(),
        get<_i79.QrBarcodeLoginUseCase>(),
        get<_i12.CheckLoginUseCase>(),
        get<_i16.LogoutUseCase>(),
        get<_i14.GetRememberLoginEmailUserCase>(),
      ));
  gh.lazySingleton<_i82.SignUpBloc>(
      () => _i82.SignUpBloc(get<_i80.SignUpUseCase>()));
  return get;
}

class _$AppModuleDepedenciesProvider
    extends _i83.AppModuleDepedenciesProvider {}

class _$ProductCateDatasourceProvider
    extends _i19.ProductCateDatasourceProvider {}

class _$ProductRemoteDatasourceProvider
    extends _i22.ProductRemoteDatasourceProvider {}

class _$ShopRepoteDatasourceProvider
    extends _i26.ShopRepoteDatasourceProvider {}

class _$ShoppingCartDatasourceProvider
    extends _i29.ShoppingCartDatasourceProvider {}

class _$UserDatasourceProvider extends _i34.UserDatasourceProvider {}

class _$AddressDatasourceProvider extends _i37.AddressDatasourceProvider {}

class _$AdsDatasourceProvider extends _i40.AdsDatasourceProvider {}

class _$AuthRepoteDatasourceProvider
    extends _i43.AuthRepoteDatasourceProvider {}
