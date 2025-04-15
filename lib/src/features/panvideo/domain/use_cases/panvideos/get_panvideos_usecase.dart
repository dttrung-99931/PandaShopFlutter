import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/panvideo/data/models/get_panvideos_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panvideo_response.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPanvideosUseCase extends EitherUseCase<PaginatedList<PanvideoDto>, GetPanvideosRequest> {
  final PanvideoRepo _repo;

  GetPanvideosUseCase(this._repo);

  @override
  Future<Either<Failure, PaginatedList<PanvideoDto>>> call(GetPanvideosRequest param) async {
    return handleRepoResult(
      repoResult: _repo.getPanvideos(param),
      onSuccess: (PaginatedList<PanvideoResponse> model) async {
        return model.mapList((e) => PanvideoDto.fromModel(e));
      },
    );
  }
}
