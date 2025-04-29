import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evievm_app/core/model/base_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/create_panmusic_response.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/get_panmusics_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/panmusic/panmusic_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'panmusic_data_source.g.dart';

@module
abstract class PanMusicDatasourceProvider {
  @singleton
  PanMusicDatasource providePanMusicDatasource(Dio dio) => _PanMusicDatasource(dio);
}

@RestApi()
abstract class PanMusicDatasource {
  @POST('/v1/PanMusics')
  @MultiPart()
  Future<BaseResponse<CreatePanMusicResponse>> createPanMusic({
    @Part() required File music,
    @Part() required String title,
    @Part() required int durationInSecs,
  });

  @GET('/v1/PanMusics/my')
  Future<PaginatedListResponse<PanMusicResponse>> getMyPanMusics(
    @Queries() GetPanMusicsRequest request,
  );

  @GET('/v1/PanMusics')
  Future<PaginatedListResponse<PanMusicResponse>> getPanMusics(
    @Queries() GetPanMusicsRequest request,
  );
}
