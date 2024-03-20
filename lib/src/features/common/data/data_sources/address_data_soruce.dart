import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_field_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'address_data_soruce.g.dart';

@module
abstract class AddressDatasourceProvider {
  @singleton
  AddressDatasource provideAddressDatasource(Dio dio) {
    return _AddressDatasource(dio);
  }
}

@RestApi()
abstract class AddressDatasource {
  @GET('/v1/Addresses')
  Future<BaseResponse<List<AddressModel>>> get();

  @GET('/v1/Addresses/ProvincesAndCities')
  Future<BaseResponse<List<AddressFieldModel>>> getProvincesAndCities();

  @GET('/v1/Addresses/CommunesAndWards/{districtCode}')
  Future<BaseResponse<List<AddressFieldModel>>> getCommunesAndWards(@Path('districtCode') String districtCode);

  @GET('/v1/Addresses/Districts/{provinceOrCityCode }')
  Future<BaseResponse<List<AddressFieldModel>>> getDistricts(@Path('provinceOrCityCode ') String districtCode);
}
