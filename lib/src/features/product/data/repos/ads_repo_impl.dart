import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/product/data/data_sources/ads/ads_data_soruce.dart';
import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/ads_repo.dart';

@LazySingleton(as: AdsRepo)
class AdsRepoImpl extends AdsRepo {
  final AdsDatasource datasource;

  AdsRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<HomeBannerModel>>> getHomeBanners() {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getHomeBanners(),
      ),
    );
  }
}
