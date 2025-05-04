import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/get_panmusics_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/panmusic_response.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panmusic_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panmusic_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPanMusicsUseCase extends EitherUseCase<PaginatedList<PanMusicDto>, GetPanMusicsRequest> {
  final PanMusicRepo _repo;

  GetPanMusicsUseCase(this._repo);

  @override
  Future<Either<Failure, PaginatedList<PanMusicDto>>> call(GetPanMusicsRequest param) async {
    return handleRepoResult(
      repoResult: _repo.getPanMusics(param),
      onSuccess: (PaginatedList<PanMusicResponse> model) async {
        return model.mapList((e) => PanMusicDto.fromModel(e));
      },
    );
  }
}
