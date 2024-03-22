import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/common/data/models/request/save_address_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_field_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';

abstract class AddressRepo extends BaseRepo {
  Future<Either<Failure, List<AddressModel>>> getMyAddresses();
  Future<Either<Failure, AddressModel>> saveMyAddresses(SaveAddressRequestModel model);
  Future<Either<Failure, List<AddressFieldModel>>> getProvincesAndCites();
  Future<Either<Failure, List<AddressFieldModel>>> getDistricts(String provinceOrCityCode);
  Future<Either<Failure, List<AddressFieldModel>>> getCommunesAndWards(String districtCode);
}
