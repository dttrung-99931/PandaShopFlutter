import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/common/data/models/response/address_field_model.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_field_dto.dart';
import 'package:evievm_app/src/features/common/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProvincesAndCitiesUseCase extends EitherUseCase<List<AddressFieldDto>, NoParams> {
  final AddressRepo _repo;

  GetProvincesAndCitiesUseCase(this._repo);

  @override
  Future<Either<Failure, List<AddressFieldDto>>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getProvincesAndCites(),
      onSuccess: (List<AddressFieldModel> model) async {
        return model.map((e) => AddressFieldDto.fromModel(e)).toList();
      },
    );
  }
}
