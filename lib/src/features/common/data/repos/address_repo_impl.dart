import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/common/data/data_sources/address_data_soruce.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_field_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressRepo)
class AddressRepoImpl extends AddressRepo {
  final AddressDatasource datasource;

  AddressRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<AddressModel>>> getMyAddresses() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.get(),
      ),
    );
  }

  @override
  Future<Either<Failure, List<AddressFieldModel>>> getCommunesAndWards(String districtCode) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getCommunesAndWards(districtCode),
      ),
    );
  }

  @override
  Future<Either<Failure, List<AddressFieldModel>>> getDistricts(String provinceOrCityCode) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getDistricts(provinceOrCityCode),
      ),
    );
  }

  @override
  Future<Either<Failure, List<AddressFieldModel>>> getProvincesAndCites() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProvincesAndCities(),
      ),
    );
  }
}
