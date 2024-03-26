import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/cate_property_template/property_template_dto.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPropertyTemplateOfCateUseCase extends EitherUseCase<PropertyTemplateDto, int> {
  final ProductRepo _repo;

  GetPropertyTemplateOfCateUseCase(this._repo);

  @override
  Future<Either<Failure, PropertyTemplateDto>> call(int categoryId) async {
    return handleRepoResult(
      repoResult: _repo.getPropertyTemplate(categoryId),
      onSuccess: (PropertyTemplateModel model) async {
        return PropertyTemplateDto.fromModel(model);
      },
    );
  }
}
