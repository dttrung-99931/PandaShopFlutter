import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/src/features/panvideo/data/data_sources/panmusic_data_source.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/create_panmusic_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/create_panmusic_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/get_panmusics_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/panmusic_response.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panmusic_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PanMusicRepo)
class PanMusicRepoImpl extends PanMusicRepo {
  final PanMusicDatasource _datasource;

  PanMusicRepoImpl(this._datasource);

  @override
  Future<Either<Failure, CreatePanMusicResponse>> createPanMusic(CreatePanMusicRequest request) async {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: _datasource.createPanMusic(
          music: request.music,
          title: request.title,
          durationInSecs: request.durationInSecs,
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, PaginatedList<PanMusicResponse>>> getMyPanMusics(GetPanMusicsRequest request) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: _datasource.getMyPanMusics(request),
      ),
    );
  }

  @override
  Future<Either<Failure, PaginatedList<PanMusicResponse>>> getPanMusics(GetPanMusicsRequest request) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: _datasource.getPanMusics(request),
      ),
    );
  }
}
