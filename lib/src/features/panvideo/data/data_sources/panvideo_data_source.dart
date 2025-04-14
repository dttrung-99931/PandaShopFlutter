import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'panvideo_data_source.g.dart';

@module
abstract class PanvideoDatasourceProvider {
  @singleton
  PanvideoDatasource providePanvideoDatasoure(Dio dio) => _PanvideoDatasource(dio);
}

@RestApi()
abstract class PanvideoDatasource {
  @POST('/v1/PanVideos')
  @MultiPart()
  Future<BaseResponse<CreatePanvideoResponse>> createPanvideo({
    @Part() required File video,
    @Part() required File thumbnailImage,
    @Part() String? description,
    @Part() required String title,
    @Part() required int durationInSecs,
  });
}
