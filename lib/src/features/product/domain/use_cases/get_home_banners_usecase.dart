import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/response/home/home_banner_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/home/home_banner_dto.dart';
import 'package:evievm_app/src/features/product/domain/repos/ads_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHomeBannersUseCase extends EitherUseCase<List<HomeBannerDto>, NoParams> {
  final AdsRepo _repo;

  GetHomeBannersUseCase(this._repo);

  @override
  Future<Either<Failure, List<HomeBannerDto>>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getHomeBanners(),
      onSuccess: (List<HomeBannerModel> model) async {
        return model.map((e) => HomeBannerDto.fromModel(e)).toList();
      },
    );
  }
}
