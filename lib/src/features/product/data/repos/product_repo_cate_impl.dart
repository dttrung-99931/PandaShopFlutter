import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/product/data/data_sources/product_cate_data_soruce.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/get_product_cates_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/cate_property_template/property_template_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/product/product_category_model.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_cate_repo.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: ProductCateRepo)
class ProductRepoImpl extends ProductCateRepo {
  final ProductCateDatasource datasource;

  ProductRepoImpl(this.datasource);

  @override
  Future<Either<Failure, List<ProductCategoryModel>>> getProductCates(GetProductCatesRequestModel params) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getProductCates(params),
      ),
    );
  }

  @override
  Future<Either<Failure, PropertyTemplateModel>> getPropertyTemplate(int templateId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getPropertyTemplate(templateId),
      ),
    );
  }

  @override
  Future<Either<Failure, ProductCategoryModel>> getById(int id) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.getById(id),
      ),
    );
  }
}
