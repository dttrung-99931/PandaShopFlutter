import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:panda_map/core/dtos/map_place_detail_dto.dart';
import 'package:panda_map/core/models/map_place_detail.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/panda_map.dart';

@lazySingleton
// EitherUseCase<MapPlaceDetail, String> : < map palce Id
class GetMapPlaceDetailUseCase extends EitherUseCase<MapPlaceDetail, String> {
  late final MapAPIService _mapService = PandaMap.mapApiService;

  GetMapPlaceDetailUseCase();

  @override
  Future<Either<Failure, MapPlaceDetail>> call(String placeId) async {
    return handleRepoResult(
      repoResult: Future(() async {
        return Right(await _mapService.getPlaceDetail(placeId));
      }),
      onSuccess: (MapPlaceDetailDto model) async {
        return MapPlaceDetail.fromJson('');
      },
    );
  }
}
