import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/create_panmusic_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/create_panmusic_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/get_panmusics_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/panmusic_response.dart';

abstract class PanMusicRepo extends BaseRepo {
  Future<Either<Failure, CreatePanMusicResponse>> createPanMusic(CreatePanMusicRequest request);
  Future<Either<Failure, PaginatedList<PanMusicResponse>>> getMyPanMusics(GetPanMusicsRequest request);
  Future<Either<Failure, PaginatedList<PanMusicResponse>>> getPanMusics(GetPanMusicsRequest request);
}
