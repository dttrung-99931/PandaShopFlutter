import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/common/data/models/request/save_address_model.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveMyAddressUseCase extends EitherUseCase<AddressDto, SaveAddressRequestModel> {
  final AddressRepo _repo;

  SaveMyAddressUseCase(this._repo);

  @override
  Future<Either<Failure, AddressDto>> call(SaveAddressRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.saveMyAddresses(param),
      onSuccess: (AddressModel model) async {
        return AddressDto.fromModel(model);
      },
    );
  }
}
