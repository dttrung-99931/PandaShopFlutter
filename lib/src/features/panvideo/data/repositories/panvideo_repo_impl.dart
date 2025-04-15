import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/model/paginated_list.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/src/features/panvideo/data/data_sources/panvideo_data_source.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/get_panvideos_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panvideo_response.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

@LazySingleton(as: PanvideoRepo)
class PanvideoRepoImpl extends PanvideoRepo {
  final PanvideoDatasource _datasource;

  PanvideoRepoImpl(this._datasource);

  @override
  Future<Either<Failure, CreatePanvideoResponse>> createPanvideo(CreatePanvideoRequest request) async {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: _datasource.createPanvideo(
          video: request.video,
          thumbnailImage: request.thumbnailImage,
          title: request.title,
          durationInSecs: request.durationInSecs,
          description: request.description,
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, File>> genThumbnailImage(File video) {
    return executeWithTryCatch(
      () async {
        final String? thumbPath = await VideoThumbnail.thumbnailFile(
          video: video.path,
          imageFormat: ImageFormat.WEBP,
          quality: 90,
        );
        if (thumbPath != null) {
          return File(thumbPath);
        }
        throw 'Cannot generate thumbnail iamge';
      },
      errorHandler: (error) {
        return ThumbnailImageFailure(error.toString());
      },
    );
  }

  @override
  Future<Either<Failure, PaginatedList<PanvideoResponse>>> getMyPanvideos(GetPanvideosRequest request) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: _datasource.getMyPanvideos(request),
      ),
    );
  }
}
