import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/shop_repo.dart';
import '../data_sources/shop_remote_data_soruce.dart';

@LazySingleton(as: ShopRepo)
class ShopRepoImpl extends ShopRepo {
  final ShopRemoteDatasource datasource;

  ShopRepoImpl(this.datasource);

  @override
  Future<Either<Failure, dynamic>> registerShop(ShopParams param) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.resgisterShop(
          userId: param.userId,
          params: param.shop,
        ),
      ),
    );
  }
}
