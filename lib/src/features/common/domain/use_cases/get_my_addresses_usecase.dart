import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMyAddressesUseCase extends EitherUseCase<List<AddressDto>, NoParams> {
  final AddressRepo _repo;

  GetMyAddressesUseCase(this._repo);

  @override
  Future<Either<Failure, List<AddressDto>>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getMyAddresses(),
      onSuccess: (List<AddressModel> model) async {
        return model.map((e) => AddressDto.fromModel(e)).toList();
      },
    );
  }
}
