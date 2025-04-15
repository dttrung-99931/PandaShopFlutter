import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/get_panvideos_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panvideo_response.dart';

abstract class PanvideoRepo extends BaseRepo {
  Future<Either<Failure, CreatePanvideoResponse>> createPanvideo(CreatePanvideoRequest request);
  Future<Either<Failure, File>> genThumbnailImage(File video);
  Future<Either<Failure, PaginatedList<PanvideoResponse>>> getMyPanvideos(GetPanvideosRequest request);
  Future<Either<Failure, PaginatedList<PanvideoResponse>>> getPanvideos(GetPanvideosRequest request);
}
