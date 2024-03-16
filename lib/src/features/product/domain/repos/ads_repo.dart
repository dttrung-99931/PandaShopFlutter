import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';

abstract class AdsRepo extends BaseRepo {
  Future<Either<Failure, List<HomeBannerModel>>> getHomeBanners();
}
